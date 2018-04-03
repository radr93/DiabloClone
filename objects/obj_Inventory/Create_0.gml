/// @description Initialize Variables

// Show or hide inventory
showInventory = false;

// Get position
var view_x = camera_get_view_x(obj_Camera.camera);
var view_y = camera_get_view_y(obj_Camera.camera); 
xOffset = 640; // relative to camera x
yOffset = 0;// relative to camera x
x = view_x+xOffset;
y = view_y+yOffset;

// Get dimensions
width = sprite_get_width(spr_Inventory);
height = sprite_get_height(spr_Inventory);

// Initialize Inventory Slots
inventoryColumns = 10;
inventoryRows = 4;
inventorySlots = (inventoryColumns*inventoryRows);
// For as many slots as there are
for (i = 0; i < inventorySlots; i += 1){
	// Create an invisible button object and give it a "slot" number
	inventoryButton[i] = instance_create_layer(0, 0, "Highest", obj_InventoryButton);
	inventoryButton[i].slot = i;
	// Initiailize Empty inventory array
	for (j = 0; j < property.MAX; j += 1){
		inventory[i, j] = -1;
	}
}