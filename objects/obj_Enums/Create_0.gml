/// @description Initialize all enums
/*
-----------------\
Table of Contents |
-----------------/
1.0	Items
	1.1 Rarities
	1.2	Types
	1.3 Equip Slots
	1.4 Properties
2.0 Player
    2.1 Classes
	2.2 Stats
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
	
	// 1.3 Equip slots
	enum equipSlot{
		head,
		neck,
		weapon,
		chest,
		offhand,
		hands,
		ring1,
		ring2,
		waist,
		feet
	}

	// 1.4 Item Properties
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

// 2.0 Player ////////
	// 2.1 Classes
	enum classes{
		mage,
		ranger,
		warrior
	}
	// 2.2 Stats
	enum stat{
		name,
		class,
		sprite,
		
		currentHealth,
		maxHealth,
		currentMana,
		maxMana,
		
		level,
		currentExp,
		expToLevel,
		statPoints,
		skillPoints,
		
		strength,
		dexterity,
		vitality,
		intelligence,
		
		coldResist,
		fireResist,
		lightResist,
		poisonResist,
		
		MAX
	}