/*

Syntax:
ds_grid_number_strings_to_real(ds_grid);

ds_grid		The ID of the ds grid to change string numbers to real for

This script parses a ds grid loaded from a .csv file (passed as an argument)
for numbers, then converts them from strings to real numbers.

Returns the grid with all numbers converted.

*/

// Initialize Variables
var grid, gridWidth, gridHeight, cellContents;
grid = argument0;
gridWidth = ds_grid_width(grid);
gridHeight = ds_grid_height(grid);

for (var c = 0; c < gridWidth; c++){
	for (var r = 0; r < gridHeight; r++){
		var cellContents = ds_grid_get(grid, c, r);
		// Convert string numbers to real numbers
		if (string_length(string_digits(cellContents)) == string_length(cellContents)){
			ds_grid_set(grid, c, r, real(string_digits(cellContents)));
		}
		// Convert -1 to -1
		if (cellContents == "-1"){
			ds_grid_set(grid, c, r, -1);	
		}
	}
}
return(grid);