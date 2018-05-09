/// @description Initialize Variables

/// Load Treasure Class data into ds grids
// Master Treasure Class sheet
tcMaster = ds_grid_csv_import("tcdb/tcMaster.csv", true, undefined, undefined, undefined);
tcMaster = ds_grid_number_strings_to_real(tcMaster);

// Armor Drop Tables
for (var i = 0; i <= 9; i++){
	armorTable[i] = ds_grid_csv_import("tcdb/armor/armor"+string(i)+".csv", true, undefined, undefined, undefined);
	armorTable[i] = ds_grid_number_strings_to_real(armorTable[i]);
	show_debug_message("armorTable["+string(i)+"]");
}

// Weapon Drop Tables
for (i = 0; i <= 9; i++){
	weaponTable[i] = ds_grid_csv_import("tcdb/weapons/weapon"+string(i)+".csv", true, undefined, undefined, undefined);
	weaponTable[i] = ds_grid_number_strings_to_real(weaponTable[i]);
	show_debug_message("weaponTable["+string(i)+"]");
}

// Misc Drop Tables
for (i = 0; i <= 2; i++){
	miscTable[i] = ds_grid_csv_import("tcdb/misc/misc"+string(i)+".csv", true, undefined, undefined, undefined);
	miscTable[i] = ds_grid_number_strings_to_real(miscTable[i]);
	show_debug_message("miscTable["+string(i)+"]");
}

// Rune Drop Tables
for (i = 0; i <= 1; i++){
	runeTable[i] = ds_grid_csv_import("tcdb/misc/runes/runes"+string(i)+".csv", true, undefined, undefined, undefined);
	runeTable[i] = ds_grid_number_strings_to_real(runeTable[i]);
	show_debug_message("runeTable["+string(i)+"]");
}

// Potion Drop Tables
for (i = 0; i < 1; i++){
	potionTable[i] = ds_grid_csv_import("tcdb/misc/potions/potions"+string(i)+".csv", true, undefined, undefined, undefined);
	potionTable[i] = ds_grid_number_strings_to_real(potionTable[i]);
	show_debug_message("potionTable["+string(i)+"]");
}

// Jewelry Drop Tables
for (i = 0; i < 1; i++){
	jewelryTable[i] = ds_grid_csv_import("tcdb/misc/jewelry/jewelry"+string(i)+".csv", true, undefined, undefined, undefined);
	jewelryTable[i] = ds_grid_number_strings_to_real(jewelryTable[i]);
	show_debug_message("jewelryTable["+string(i)+"]");
}
