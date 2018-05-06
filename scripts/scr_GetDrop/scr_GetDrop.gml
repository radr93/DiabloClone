/*

Syntax:
scr_getDrop(treasureClass);

treasureClass	The treasure class of the drop source (a string)

This script uses the treasure class of the drop source to determine an
item drop. First, it looks up the treasureClass in the tcMaster table.

When it finds it, it iterates through all of the sub-treasure class choices
for that treasure class until it chooses one (based on a percentage chance).

When it chooses a sub-treasure class (or "noDrop" if it failed the drop check),
it then iterates through all of the item choices and additional (lower tiered)
sub-treasure class choices within that sub-treasure class.

If it chose an item, the item's name as a string is returned immediately.

If it chose another sub-treasure class, it will iterate through that one and
so on until it choose an item.

Eventually, this script will return either "noDrop" or the name of the item drop
as a string which can then be looked up in the item database to gather it's
properties in the next step of the drop process.

*/

// Initialize Variables
var tcdb, sourceTC, index, totalChoices, totalProb, choice, probIndex, probValue, dropRange, roll;

tcdb		 = obj_TreasureClassDatabase;
sourceTC	 = argument0;
index		 = ds_grid_value_y(tcdb.tcMaster, 0, 0, 0, ds_grid_height(tcdb.tcMaster), sourceTC);
totalChoices = real(ds_grid_get(tcdb.tcMaster, tcmColumn.sumChoices, index));
totalProb	 = real(ds_grid_get(tcdb.tcMaster, tcmColumn.totalProb, index));

show_debug_message("Total number of choices within "+sourceTC+": "+string(totalChoices));
show_debug_message("Total probability of all choices for "+sourceTC+": "+string(totalProb));

// Get first sub-treasure class choice and it's probability
choice = tcmColumn.choice1;
probIndex = tcmColumn.prob1;
probValue = real(ds_grid_get(tcdb.tcMaster, probIndex, index));

// Roll random number
roll = random(1);
dropRange = 0;
show_debug_message("\nChance rolled was: "+string(roll)+"(%) - looking up sub-treasure class.");

// Iterate through sub-treasure class choices until a choice (or "noDrop") is selected
for (var c = 0; c < totalChoices; c++){;
	show_debug_message("Attempting to roll from TC: "+ds_grid_get(tcdb.tcMaster, choice, index));
	// Get the probability of current choice being selected, and see if it falls in range of selection
	show_debug_message("Choice iteration is: "+string(c)+".");
	probValue = real(ds_grid_get(tcdb.tcMaster, probIndex, index));
	show_debug_message(ds_grid_get(tcdb.tcMaster, choice, index)+"'s probability is "+string(probValue)+"/"+string(totalProb)+" = "+string(probValue/totalProb)+"%");
	dropRange = dropRange+(probValue/totalProb);
	show_debug_message(ds_grid_get(tcdb.tcMaster, choice, index)+"'s acceptable dropRange is up to "+string(dropRange)+"%");
	
	// If that sub-treasure class choice is fell in range
	if (roll <= dropRange){
		
		// Select it
		var drop = ds_grid_get(tcdb.tcMaster, choice, index);
		show_debug_message("\nRoll successful. Roll "+string(roll)+"(%) is less than or equal to dropRange "+string(dropRange)+"%\n"+
		"Looking up a drop from sub-treasure class: "+drop);
		
		// If it was an armor sub-treasure class
		if (string_pos("armor", drop)){
			// Find out which armor tc number (armor[0] armor[1] armor[2] etc..) has been selected
			var armorNumber = string_digits(ds_grid_get(tcdb.tcMaster, choice, index));
			show_debug_message("Selecting drop...");
			// Continue iterating until an item has been selected
			while (string_pos("armor", drop)){
				show_debug_message(" WHILE LOOP ITERATION BEGINNING ");
				// Find out how many choices there are in that armor tc and add their probabilities together for a total
				totalChoices = ds_grid_height(tcdb.tcArmor[armorNumber]);
				totalProb = 0;
				for (var r = 1; r <= totalChoices; r++){
					totalProb += real(ds_grid_get(tcdb.tcArmor[armorNumber], 1, r));
				}
				
				show_debug_message("In "+drop+", there are "+string(totalChoices)+" choices to pick from.");
				show_debug_message("Total prob is "+string(totalProb));
			
				// Roll for an item
				roll = random(1);
				dropRange = 0;
				show_debug_message("\nChance rolled was: "+string(roll)+"(%)");
			
				// Iterate until an item or treasure class is selected
				for (r = 1; r <= totalChoices; r++){
				
					// Get probability of choice and range in which it will drop
					probValue = real(ds_grid_get(tcdb.tcArmor[armorNumber], 1, r));
					show_debug_message(ds_grid_get(tcdb.tcArmor[armorNumber], 0, r)+"'s probability is "+string(probValue)+"/"+string(totalProb)+" = "+string(probValue/totalProb)+"%");
					dropRange = dropRange+(probValue/totalProb);
					show_debug_message(ds_grid_get(tcdb.tcArmor[armorNumber], 0, r)+"'s acceptable dropRange is up to "+string(dropRange)+"%");
				
					// If it's in the correct range to drop
					if (roll <= dropRange){
					
						// Get the string of the choice
						show_debug_message("Valid roll. Roll "+string(roll)+"(%) is less than or equal to dropRange "+string(dropRange)+"%");
						drop = ds_grid_get(tcdb.tcArmor[armorNumber], 0, r);
						show_debug_message("From armor"+string(armorNumber)+", selected "+drop);
					
						// If another sub-treasure class was selected
						if (string_pos("armor", drop) != 0){
							show_debug_message("Armor class selected. Must re-do the while loop");
							armorNumber = string_digits(ds_grid_get(tcdb.tcMaster, choice, index));
							break;
						}
						// Otherwise return the item that was selected
						else{
							show_debug_message("Returned drop "+drop+"\n");
							return(drop);
						}
					}
					else{
						show_debug_message("\nRoll: "+string(roll)+"(%) is not less than or equal to dropRange "+string(dropRange)+"(%)\n"+
							   "Invalid dropRange, did not roll this choice, moving onto the next one...\n");
					}
				}
			}
		}
			// If it was a weapon sub-treasure class
			else if (string_pos("weapon", ds_grid_get(tcdb.tcMaster, choice, index)) != 0){
				var weaponNumber = string_digits(ds_grid_get(tcdb.tcMaster, choice, index));
				show_debug_message("Rolled weapon"+weaponNumber+" successfully!! TIME TO SEARCH FOR A WEAPON!");
				break;
			}
	}
	
	// If that choice wasn't selected
	else{
		show_debug_message("\nRoll: "+string(roll)+"(%) is not less than or equal to dropRange "+string(dropRange)+"(%)\n"+
						   "Invalid dropRange, did not roll this choice, moving onto the next one...\n");
		choice += 2;
		probIndex += 2;
	}
}

// If choice was noDrop
show_debug_message("RETURNING noDrop from scr_GetDrop (bottom)");
drop = "noDrop"
return(drop);