/// @description Draw Inventory

// Set Variables
var xOffset = 640;
var yOffset = 0;

// If you press the toggleInventory key, open or close the inventory
if (keyboard_check_pressed(input.toggleInventory)){
	if (showInventory == true){showInventory = false;}
	else{showInventory = true;}
}

// Draw the inventory if it's open
if (showInventory = true){
    draw_sprite(spr_Inventory, 0, xOffset, yOffset);

    var rowLength;
    rowLength = 8;

    var x1, y1;
    x1 = xOffset + 64 + 8; //Top left corner of inventory + top left corner of first box + to center of first box
    y1 = yOffset + 352 + 8;
    
    //Arrange all the buttons in each row, going down to the start of the next row each time rowlength is exceeded
    for (i = 0; i < inventorySlots; i +=1){
        if (i == rowLength){
            rowLength += 8;
            x1 -= 256;
            y1 += 32;
        }
        inventoryButton[i].x = x1;
        inventoryButton[i].y = y1;
		draw_text(x1, y1, string(inventoryButton[i].slot)); // Draw slot number on top of slot
        x1 += 32;
    }
}