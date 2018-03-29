/// @description Initialize Variables

showInventory = false;

// Initialize Inventory Slots
inventoryColumns = 10;
inventoryRows = 4;
inventorySlots = (inventoryColumns*inventoryRows);
// For as many slots as there are
for (i = 0; i < inventorySlots; i += 1){
	// Create an object and give it a "slot" number
	inventoryButton[i] = instance_create_layer(0, 0, "Instances", obj_InventoryButton);
	inventoryButton[i].slot = i;
	// Set all properties of all slots to empty (-1)
	for (j = 0; j < property.MAX; j += 1){
		inventory[i, j] = -1;
	}
}