/// @description Initialize Item Database


// Load Item Databases into ds grids
var tableWidth, tableHeight, cellContents;

// Load Armor database
show_debug_message("Loading armor database...");
armorDB = ds_grid_csv_import("idb/armor.csv", true, undefined, undefined, undefined);
armorDB = ds_grid_number_strings_to_real(armorDB);

// Load Weapons Database
show_debug_message("loaded idb/armor.csv\nLoading weapons database...");
weaponDB = ds_grid_csv_import("idb/weapons.csv", true, undefined, undefined, undefined);
weaponDB = ds_grid_number_strings_to_real(weaponDB);

// Load Misc Items Database
show_debug_message("loaded idb/weapons.csv\nLoading misc database...");
miscDB = ds_grid_csv_import("idb/misc.csv", true, undefined, undefined, undefined);
miscDB = ds_grid_number_strings_to_real(miscDB);
show_debug_message("loaded idb/misc.csv");