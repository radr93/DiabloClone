var tcdb		 = obj_TreasureClassDatabase;
var sourceTC	 = argument0;
var rowIndex	 = ds_grid_value_y(tcdb.tcMaster, 0, 0, 0, ds_grid_height(tcdb.tcMaster)-1, sourceTC);
var totalChoices = real(ds_grid_get(tcdb.tcMaster, tcmColumn.sumChoices, rowIndex));
var totalProb	 = real(ds_grid_get(tcdb.tcMaster, tcmColumn.totalProb, rowIndex));
var choiceIndex  = tcmColumn.choice1;
var probIndex	 = tcmColumn.prob1;
var roll		 = random(1);
var dropRange	 = 0;
for (var c = 0; c < totalChoices; c++){;
	var probValue = real(ds_grid_get(tcdb.tcMaster, probIndex, rowIndex));
	var dropRange = dropRange+(probValue/totalProb);
	if (roll <= dropRange){
		var choice			= ds_grid_get(tcdb.tcMaster, choiceIndex, rowIndex);
		var dropTableGrid	= scr_TreasureClassStringToGrid(choice);
		var itemDrop = 0;
		while (itemDrop == 0){
			totalChoices = ds_grid_height(dropTableGrid);
			totalProb = 0;
			for (var row = 1; row <= totalChoices; row++){
				totalProb += real(ds_grid_get(dropTableGrid, 1, row));
			}
			roll = random(1);
			dropRange = 0;
			for (row = 1; row <= totalChoices; row++){
				probValue = real(ds_grid_get(dropTableGrid, 1, row));
				dropRange = dropRange+(probValue/totalProb);
				if (roll <= dropRange){
					choice = ds_grid_get(dropTableGrid, 0, row);
					itemDrop = scr_ParseDropTableChoice(choice);
					if (itemDrop == 0){
						dropTableGrid	= scr_TreasureClassStringToGrid(choice);
						break;
					}
					else{
						return(choice);
					}
				}
			}
		}
	}
	else{
		choiceIndex += 2;
		probIndex += 2;
	}
}
choice = "noDrop"
return(choice);