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
show_debug_message("\n\nNEW ITERATION ####################");
// Iterate through each cell specified
for (h = 0; h < height; h++){
	for (w = 0; w < width; w++){
		show_debug_message("\nSearching Column "+string(w)+" Row "+string(h)+"....");
		// If the item is within the grid's boundaries
		if (xStart + (width-1) < gridWidth and yStart + (height-1) < gridHeight){
			// If there have been 0 or 1 items counted in the space so far
			if (itemsInSpaceToOccupy < 2){
				// Update previous cell to current cell
				previousSpaceID = ds_grid_get(grid, xx, yy); // Get spaceID for current cell
				show_debug_message("ID of the cell being checked = "+string(previousSpaceID));
				// If the current cell wasn't empty
				if (previousSpaceID != -1 and previousSpaceID != itemInSpaceID){
					show_debug_message("previous space was not empty...");
					// Add to total number of items in the space
					itemsInSpaceToOccupy++;
					show_debug_message("itemsInSpaceToOccupy now = "+string(itemsInSpaceToOccupy));
					// If that brings you to 1 item in the space
					if (itemsInSpaceToOccupy == 1){
						itemInSpaceID = previousSpaceID; // Get the item's space ID
						show_debug_message("found 1 item so far. storing itemInSpaceID "+string(itemInSpaceID));
					}
					// Otherwise you have more than 1 item in the space, return 0 (no room)
					else{
						show_debug_message("Line 57, returning 0, more than 1 item in space (itemsInSpaceToOccupy = "+string(itemsInSpaceToOccupy)+")");
						return(0);
					}
				}
			}
			// Otherwise there's 2 or more items in the space, return 0 (no room)
			else{
				show_debug_message("Line 64, returning 0, more than 1 item in space (itemsInSpaceToOccupy = "+string(itemsInSpaceToOccupy)+")");
				return(0);
			}
		}
		// If outside of the boundaries, return 0 (no room)
		else{
			show_debug_message("Line 70, returning 0, item out of bounds.");
			show_debug_message(string(xx) + " + " + string((width-1)) + "<= " + string(gridWidth) + " and "+string(yy) + " + " + string((height-1)) + "<=" + string(gridHeight))
			return(0);
		}
		show_debug_message("Checking next column..");
		xx++; // Check next column
	}
	show_debug_message("Now resetting columns and moving to next row..");
	xx = argument1; // Reset Columns
	yy++; // Check next row
}

// If there were no items in the space
if (itemsInSpaceToOccupy == 0){
	show_debug_message("Line 83, Space Free! Returning -1!")
	return(-1);
}
// If there was one item or in the space
else if (itemsInSpaceToOccupy == 1){
	// Return the item's space ID
	show_debug_message("Line 89, Only 1 item detected! Returning "+string(itemInSpaceID));
	return(itemInSpaceID);
}

else{
	show_debug_message("Line 94, ds_grid_check_region() failed to check for space. itemsInSpaceToOccupy =="+string(itemsInSpaceToOccupy));
}