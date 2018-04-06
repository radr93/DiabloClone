/*

Syntax:
ds_grid_check_region(grid, x, y, width, height);

	grid	The index of the ds_grid.
	xx		The x position of the left of the region in the grid to check.
	yy 		The y position of the top of the region in the grid to check.
	width 	The number of columns to search away from the x position.
	height 	The number of rows to search away from the y position.

This script checks each cell in a ds_grid in the given range.
If all cells were empty, the script returns -1.
If there was 1 item found in the space, returns the item's spaceID.
If there was more than 1 item found in the space, returns 0.

*/

var grid, xx, yy, width, height, totalCells, space, itemsInSpace, gridWidth, gridHeight, itemInSpaceID;

grid = argument0;
xx = argument1;
yy = argument2;
width = argument3;
height = argument4;
gridWidth = ds_grid_width(grid);
gridHeight = ds_grid_height(grid);

itemsInSpace = 0; // Increments if there are other items in the spaces checked
space = -1; // Stores the spaceID of the item of the last cell you checked (-1 = empty/no item)

var cellCount = 0;
for (w = 0; w < width; w++){
	for (h = 0; h < height; h++){
		if (xx + (width-1) < gridWidth and yy + (height-1) < gridHeight){
			// If previous cell checked was empty
			if (space == -1){
				space = ds_grid_get(grid, xx, yy); // Get spaceID for current cell
				if (space != -1){ // If current cell isn't empty
					itemsInSpace++; // Keep track
					itemInSpaceID = space; // Get item's space ID
				}
			}
			else if (itemInSpaceID > 0){
				space = ds_grid_get(grid, xx, yy); // Get spaceID for current cell
				if (space != itemInSpaceID){ // If current cell isn't empty
					itemsInSpace++; // Keep track
					itemInSpaceID = space; // Get item's space ID
				}
			}
			// If there was already 1 item found in the region
			if (itemsInSpace == 1){
				space = ds_grid_get(grid, xx, yy); // Get spaceID for current cell
				if (space != -1 and space != itemInSpaceID){ // If current cell isn't empty
					itemsInSpace++; // Keep track
				}
			}
			// If there was more than one item in found in the region
			else{
				break;
			}
		}
		xx++; // Check next column
	}
	xx = argument1; // Reset Columns
	yy++ // Check next row
}

// If the region is clear
if (itemsInSpace == 0){
	// Return a clear region
	return(-1);
}

// If there was 1 item found in the region
else if (itemsInSpace == 1){
	// Return item's spaceID from the grid
	return(itemInSpaceID);
}

// Otherwise there was more than 1 item
else{
	return(0);
}