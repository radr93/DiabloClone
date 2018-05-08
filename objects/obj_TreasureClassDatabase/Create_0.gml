/// @description Initialize Variables

/// Load Treasure Class data into ds grids
// Master Treasure Class sheet
tcMaster = load_csv("tcdb/tcMaster.csv");

// Armor Drop Tables
for (var i = 0; i <= 9; i++){
	armorTable[i] = csv_to_grid("tcdb/armor/armor"+string(i)+".csv", true, undefined, undefined, undefined);
	show_debug_message("armorTable["+string(i)+"]");
}
// Weapon Drop Tables
for (i = 0; i <= 9; i++){
	weaponTable[i] = csv_to_grid("tcdb/weapons/weapon"+string(i)+".csv", true, undefined, undefined, undefined);
	show_debug_message("weaponTable["+string(i)+"]");
}
// Misc Drop Tables
for (i = 0; i <= 2; i++){
	miscTable[i] = csv_to_grid("tcdb/misc/misc"+string(i)+".csv", true, undefined, undefined, undefined);
	show_debug_message("miscTable["+string(i)+"]");
}
// Rune Drop Tables
for (i = 0; i <= 1; i++){
	runeTable[i] = csv_to_grid("tcdb/misc/runes/runes"+string(i)+".csv", true, undefined, undefined, undefined);
	show_debug_message("runeTable["+string(i)+"]");
}
// Potion Drop Tables
for (i = 0; i < 1; i++){
	potionTable[i] = csv_to_grid("tcdb/misc/potions/potions"+string(i)+".csv", true, undefined, undefined, undefined);
	show_debug_message("potionTable["+string(i)+"]");
}
// Jewelry Drop Tables
for (i = 0; i < 1; i++){
	jewelryTable[i] = csv_to_grid("tcdb/misc/jewelry/jewelry"+string(i)+".csv", true, undefined, undefined, undefined);
	show_debug_message("jewelryTable["+string(i)+"]");
}