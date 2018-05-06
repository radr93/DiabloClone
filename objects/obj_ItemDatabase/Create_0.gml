/// @description Initialize Item Database

// The header of each column in the .csv file 
enum adb{
	name,
	tc,
	type,
	subtype,
	sprite,
	width,
	height,
	maxDurability,
	minDefence,
	maxDefence,
	reqStrength,
	reqLevel,
	maxSockets,

	MAX
}

armorDB = load_csv("idb/armor.csv");