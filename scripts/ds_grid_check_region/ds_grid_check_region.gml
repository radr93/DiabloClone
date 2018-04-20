/*

Syntax:
ds_grid_check_region(grid, x, y, width, height);

	grid	The index of the ds_grid.
	xx		The x position of the left of the region in the grid to check.
	yy 		The y position of the top of the region in the grid to check.
	width 	The total width of space to check
	height 	The total height of space to check

This script checks each cell in a ds_grid in the given range.
If all cells were empty, the script returns -1.
If there was 1 item found in the space, returns the item's spaceID.
If there was more than 1 item found in the space, returns 0.

*/

var grid, xStart, yStart, width, height, gridWidth, gridHeight,  itemsInSpaceToOccupy, previousSpaceID, itemInSpaceID;

grid = argument0;
xStart = argument1;
yStart = argument2;
width = argument3;
height = argument4;
gridWidth = ds_grid_width(grid);
gridHeight = ds_grid_height(grid);

itemsInSpaceToOccupy = 0; // How many items are in the space you want to occupy
previousSpaceID = -1; // Stores the spaceID of the last cell you checked (-1 = empty/no item)
itemInSpaceID = -1; // Store the ID of the first item encountered 

var xx = xStart;
var yy = yStart;
// Iterate through each cell specified
for (h = 0; h < height; h++){
	for (w = 0; w < width; w++){
		// If the item is within the grid's boundaries
		if (xStart + (width-1) < gridWidth and yStart + (height-1) < gridHeight){
			// If there have been 0 or 1 items counted in the space so far
			if (itemsInSpaceToOccupy < 2){
				// Update previous cell to current cell
				previousSpaceID = ds_grid_get(grid, xx, yy); // Get spaceID for current cell
				// If the current cell wasn't empty
				if (previousSpaceID != -1 and previousSpaceID != itemInSpaceID){
					// Add to total number of items in the space
					itemsInSpaceToOccupy++;
					// If that brings you to 1 item in the space
					if (itemsInSpaceToOccupy == 1){
						itemInSpaceID = previousSpaceID; // Get the item's space ID
					}
					// Otherwise you have more than 1 item in the space, return 0 (no room)
					else{
						return(0);
					}
				}
			}
			// Otherwise there's 2 or more items in the space, return 0 (no room)
			else{
				return(0);
			}
		}
		// If outside of the boundaries, return 0 (no room)
		else{			
			return(0);
		}
		xx++; // Check next column
	}
	xx = argument1; // Reset Columns
	yy++; // Check next row
}

// If there were no items in the space
if (itemsInSpaceToOccupy == 0){
	return(-1);
}
// If there was one item or in the space
else if (itemsInSpaceToOccupy == 1){
	// Return the item's space ID
	return(itemInSpaceID);
}

else{ // Script Failed
	show_debug_message("Line 94, ds_grid_check_region() failed to check for space. itemsInSpaceToOccupy =="+string(itemsInSpaceToOccupy));
}