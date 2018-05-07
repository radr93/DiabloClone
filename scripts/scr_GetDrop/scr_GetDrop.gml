/*

Syntax:
scr_getDrop(treasureClass);

treasureClass	The treasure class of the drop source (a string)

Returns:
Either an item's name as a string or "noDrop".

Description:
This script uses the treasure class of the drop source to determine an
item drop. First, it looks up the treasureClass in the tcMaster table.

When it finds it, it makes a choice from any of the (up to 10) drop tables
in that given treasure class.

This is done by checking the probability of choosing each drop table against a random number.
It iterates until a choice is selected, or it finishes looping through all choices.

If it iterates through each choice without selecting one, it's considered "noDrop" (which is another probability that
is factored into the total probability, listed under the column noDrop).

If it fails the drop check, it returns "noDrop" at this point.

If it selected one of the drop table choices ("armor3", "weapon2", "misc5" etc.), it then
looks up the corresponding tc grid for that choice. It will iterate through all of the choices
from the drop table, and then select one by checking it's probability against a random number.
The choice will be an item's name as a string, or another (lower tiered) treasure class.

If it chose an item, the item's name as a string is returned immediately.

If it chose another drop table, it will look up the corresponding tc grid for that drop table
and iterate through it's choices, so on and so forth until it chooses an item.

*/

// Initialize Variables
var tcdb, sourceTC, rowIndex, totalChoices, totalProb, choiceIndex, probIndex, probValue, dropRange, roll;

tcdb		 = obj_TreasureClassDatabase;															// Shorter name reference to database object
sourceTC	 = argument0;																			// Treasure Class of the drop source
rowIndex	 = ds_grid_value_y(tcdb.tcMaster, 0, 0, 0, ds_grid_height(tcdb.tcMaster)-1, sourceTC);	// Treasure Class's row in tcMaster.csv
totalChoices = real(ds_grid_get(tcdb.tcMaster, tcmColumn.sumChoices, rowIndex));					// Number of choices listed in that row
totalProb	 = real(ds_grid_get(tcdb.tcMaster, tcmColumn.totalProb, rowIndex));						// Total probability of all choices

show_debug_message(	"Found treasure class \""+sourceTC+"\" at position "+string(rowIndex)+" in tcMaster.csv\n"+
					"Total choices listed: "+string(totalChoices)+"\n"+
					"Total prob of choices: "+string(totalProb));

// Get column indexes of first drop table and it's probability of rolling (from tcMaster grid).
choiceIndex = tcmColumn.choice1;
probIndex	= tcmColumn.prob1;

// Roll random number
roll = random(1);
dropRange = 0;
show_debug_message("\nRolled: "+string(roll)+"%\n");

// Iterate through each drop table choice until one is selected (or return "noDrop" if none are selected)
for (var c = 0; c < totalChoices; c++){;
	
	// Get the probability of the current drop table being selected,
	show_debug_message("Choice #"+string(c)+" is "+ds_grid_get(tcdb.tcMaster, choiceIndex, rowIndex)+".");
	probValue = real(ds_grid_get(tcdb.tcMaster, probIndex, rowIndex));
	show_debug_message("Probability of rolling is "+string(probValue)+"/"+string(totalProb)+" = "+string(probValue/totalProb)+"%");
	show_debug_message("thus current accepted drop range is "+string(dropRange)+"+"+string(probValue/totalProb)+" = "+string(dropRange+(probValue/totalProb)));
	dropRange = dropRange+(probValue/totalProb);
	
	// If that drop table was selected
	if (roll <= dropRange){
		var choice, dropTableGrid, tcNumber, itemDrop;
		
		// Get the name of the drop table (as a string) e.g. "armor3", "weapon7", "misc4" and then get the corresponding ds grid id e.g. tcdb.armorTable[3], tcdb.weaponTable[7], tcdb.tcMisc[4]
		choice			= ds_grid_get(tcdb.tcMaster, choiceIndex, rowIndex);
		dropTableGrid	= scr_TreasureClassStringToGrid(choice);
		show_debug_message(	"\nRoll successful. Roll "+string(roll)+"% is less than or equal to dropRange "+string(dropRange)+"%\n"+
							"Now looking up a drop from: "+choice+" / grid ID# "+string(dropTableGrid));
							
		// While loop condition - if iteration process selects another tc from the drop table, itemDrop remains 0.
		// When an item is selected, itemDrop changes to 1 and breaks the while loop.
		itemDrop		= 0;
		
		// Iterate until an item has been selected
		while (itemDrop == 0){
			show_debug_message("\n ## FRESH ITERATION ### ");
			
			// Find out how many choices there are in that drop table, and then add their probabilities together for a total
			totalChoices = ds_grid_height(dropTableGrid);
			totalProb = 0;
			for (var row = 1; row <= totalChoices; row++){
				totalProb += real(ds_grid_get(dropTableGrid, 1, row));
			}
			show_debug_message("There are "+string(totalChoices)+" choices in \""+choice+"\" with a total probability of "+string(totalProb)+".");
			
			// Roll for a selection in the drop table
			roll = random(1);
			dropRange = 0;
			show_debug_message("\nRolled: "+string(roll)+"%\n");
			
			// Iterate through each row until a selection is made
			for (row = 1; row <= totalChoices; row++){
				
				// Get probability of selecting current choice within the drop table
				probValue = real(ds_grid_get(dropTableGrid, 1, row));
				show_debug_message("Probability of rolling "+ds_grid_get(dropTableGrid, 0, row)+" is "+string(probValue)+"/"+string(totalProb)+" = "+string(probValue/totalProb)+"%");
				show_debug_message("thus current accepted drop range is "+string(dropRange)+"+"+string(probValue/totalProb)+" = "+string(dropRange+(probValue/totalProb)));
				dropRange = dropRange+(probValue/totalProb);
				
				// If that choice was selected
				if (roll <= dropRange){
					
					// Get the string of the choice
					choice = ds_grid_get(dropTableGrid, 0, row);
					show_debug_message( "\nRoll succesful. Roll was "+string(roll)+"%, which is is less than or equal to accepted dropRange of "+string(dropRange)+"%\n"+
										"Successfully selected "+choice+".");
					
					// Parse choice's string to see if it was another drop table or an item
					itemDrop = scr_ParseDropTableChoice(choice)
					
					// If it was another drop table
					if (itemDrop == 0){
						// Update to newly selected grid and re-do while loop
						show_debug_message(choice+" is another drop table. Running a new iteration");
						dropTableGrid	= scr_TreasureClassStringToGrid(choice);
						break;
					}
					
					// Otherwise it was an item (name as a string), return it.
					else{
						show_debug_message(choice+" is a valid item. Returning drop "+choice+"\n");
						return(choice);
					}
				}
				else{
					show_debug_message( "\nRoll: "+string(roll)+"(%) is not less than or equal to dropRange "+string(dropRange)+"(%)\n"+
										"Did not roll this choice, moving onto the next one...\n");
				}
			}
		}
	}
	
	// If that choice wasn't selected, move to the next one.
	else{
		show_debug_message("Roll: "+string(roll)+"(%) is not less than or equal to dropRange "+string(dropRange)+"(%)\n"+
						   "Did not roll this choice, moving onto the next one...\n");
		choiceIndex += 2;
		probIndex += 2;
	}
}

// If choice was noDrop (roll was never <= dropRange for any choice)
show_debug_message("Iterated through all choices and roll was never <= dropRange. \"noDrop\" selected. \nReturning \"noDrop\".");
choice = "noDrop"
return(choice);