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
	    magic = c_aqua,
	    rare = c_yellow,
	    unique = c_orange,
	}
	
	// 1.2 Item Types
	
	enum type{
		potion,
		
	}
	
	// 1.3 Item Properties
	// Used to hold values for item properties in inventory/item held/ground item arrays
	enum property{
		name,
		type,
		rarity,
		identified,
		sprite,
		object,
		
		prop1stat,
		prop1value,
		prop2stat,
		prop2value,
		
		unidtooltip,
		tooltip,
	
		MAX
	}