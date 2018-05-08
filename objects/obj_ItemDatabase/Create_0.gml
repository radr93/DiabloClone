/// @description Initialize Item Database


show_debug_message("Loading armor database...");
// Load Item Databases into ds grids
armorDB = csv_to_grid("idb/armor.csv", true, undefined, undefined, undefined);
show_debug_message("loaded idb/armor.csv\nLoading weapons database...");
weaponDB = csv_to_grid("idb/weapons.csv", true, undefined, undefined, undefined);
show_debug_message("loaded idb/weapons.csv\nLoading misc database...");
miscDB = csv_to_grid("idb/misc.csv", true, undefined, undefined, undefined);
show_debug_message("loaded idb/misc.csv");