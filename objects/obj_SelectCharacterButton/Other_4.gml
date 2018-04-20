/// @description Load Information

// Get player information from save file
var playerData = ds_map_create();
ini_open("save/"+global.saveSlot[saveSlot]+"/playerData.ini");
ds_map_read(playerData, ini_read_string("Save", "Player Data", "No such data"));
ini_close();

// Put player information into an array
for (p = 0; p <  property.MAX; p++){
	stats[p] = playerData[? p];
}

// Delete ds_map
ds_map_destroy(playerData);