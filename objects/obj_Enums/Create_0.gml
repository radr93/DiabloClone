/// @description Initialize all enums
/*
-----------------\
Table of Contents |
-----------------/
1.0	Items
	1.1 Item Rarities
	1.2	Item Properties

*/


// 1.0 Items ////////
	// 1.1 Item Rarities
	enum rarity{
	    normal = c_white,
	    magic = c_blue,
	    rare = c_yellow,
	    unique = c_orange,
	}
	
	// 1.2 Item Types
	
	enum type{
	
	}
	
	
	// 1.3 Item Properties
	// Used to hold values for item properties in inventory/item held/ground item arrays
	enum property{
		item,
		type,
		sprite,
		width,
		height,
		object,
		
		rarity,
		identified,
		
		prop1stat,
		prop1value,
		prop2stat,
		prop2value,
		
		name,
		unidtooltip,
		tooltip,
	
		MAX
	}