/// @description Initialize Variables

/// Load Treasure Class data into ds grids
// Master Treasure Class sheet
tcMaster = load_csv("tcdb/tcMaster.csv");

// Armor Drop Tables
for (var i = 0; i <= 9; i++){
	armorTable[i] = load_csv("tcdb/armor/armor"+string(i)+".csv");
	show_debug_message("armorTable["+string(i)+"]");
}
// Weapon Drop Tables
for (i = 0; i <= 9; i++){
	weaponTable[i] = load_csv("tcdb/weapons/weapon"+string(i)+".csv");
	show_debug_message("weaponTable["+string(i)+"]");
}
// Misc Drop Tables
for (i = 0; i <= 2; i++){
	miscTable[i] = load_csv("tcdb/misc/misc"+string(i)+".csv");
	show_debug_message("miscTable["+string(i)+"]");
}
// Rune Drop Tables
for (i = 0; i <= 1; i++){
	runeTable[i] = load_csv("tcdb/misc/runes/runes"+string(i)+".csv");
	show_debug_message("runeTable["+string(i)+"]");
}
// Potion Drop Tables
for (i = 0; i < 1; i++){
	potionTable[i] = load_csv("tcdb/misc/potions/potions"+string(i)+".csv");
	show_debug_message("potionTable["+string(i)+"]");
}
// Jewelry Drop Tables
for (i = 0; i < 1; i++){
	jewelryTable[i] = load_csv("tcdb/misc/jewelry/jewelry"+string(i)+".csv");
	show_debug_message("jewelryTable["+string(i)+"]");
}