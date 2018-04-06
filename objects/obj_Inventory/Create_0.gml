/// @description Initialize Variables

// Show or hide inventory
showInventory = false;

// Get position
var view_x = camera_get_view_x(obj_Camera.camera);
var view_y = camera_get_view_y(obj_Camera.camera); 
xOffset = 640; // relative to camera x
yOffset = 0;// relative to camera y
x = view_x+xOffset;
y = view_y+yOffset;

// Get dimensions of entire inventory
width = sprite_get_width(spr_Inventory);
height = sprite_get_height(spr_Inventory);

// Initialize Grid
columns = 10;
rows = 6;
totalCells = columns*rows;
IDindex = 1; // increments each time an item gets placed in the grid (item uses this number as it's space ID)
cellWidth = 32;
cellHeight = 32;
grid = ds_grid_create(columns, rows);
ds_grid_clear(grid, -1); // set all cells to -1 ("empty")

// Get grid position
gridXoffset = 32;
gridYoffset = 320;
gridX = view_x+(xOffset+gridXoffset);
gridY = view_y+(yOffset+gridYoffset);

// Initialize Inventory array to store item information in each cell
for (c = 0; c < totalCells; c++){
	for (p = 0; p < property.MAX; p += 1){
		inventory[c, p] = -1;
	}
}

// Initialize Item Held array to store item information for item held on the cursor
for (p = 0; p < property.MAX; p += 1){
		itemHeld[p] = -1;
}