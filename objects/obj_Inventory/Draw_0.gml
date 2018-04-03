/// @description Draw inventory to screen

// Draw the inventory and arrage buttons if it's open
if (showInventory = true){
    draw_sprite_ext(spr_Inventory, 0, x, y, 1, 1, 0, c_white, 1);
    var rowLength;
    rowLength = 8;
    var xx, yy;
    xx = x + 64 + 16; //Top left corner of inventory + top left corner of first box + to center of first box
    yy = y + 352 + 16;
    //Arrange all the buttons in each row, going down to the start of the next row each time rowlength is exceeded
    for (i = 0; i < inventorySlots; i +=1){
		// If you reach the end of the row, go to the start of the next row
        if (i == rowLength){
            rowLength += 8;
            xx -= 256;
            yy += 32;
        }
        inventoryButton[i].x = xx;
        inventoryButton[i].y = yy;
		//draw_text(xx, yy, string(inventoryButton[i].slot)); // Draw slot number on top of slot
        xx += 32;
    }
}