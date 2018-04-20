/// @description Initialize all enums
/*
-----------------\
Table of Contents |
-----------------/
1.0	Items
	1.1 Rarities
	1.2	Item Types
	1.3 Weapon Types
	1.4 Equip Slots
	1.5 Properties
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
		set = c_lime,
	    unique = c_orange
	}
	
	// 1.2 Item Types
	enum type{
		head,
		neck,
		weapon,
		chest,
		shield,
		hands,
		ring,
		belt,
		feet,
		misc
	}
	
	// 1.3 Weapon Types
	enum weapon{
		sword,
		axe,
		mace,
		bow,
		polearm		
	}
	
	// 1.4 Weapon Sub-Types
	enum weaponSub{
		blunt,
		sharp,
		ranged
	}
	// 1.5 Equip slots
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

	// 1.6 Item Properties
	// Used to hold values for item properties in inventory/item held/ground item arrays
	enum property{
		rarity,			// normal, magic, rare, unique
		type,			// weapon, head, chest, ring, shield etc.
		weaponType,		// sword, axe, bow etc.
		weaponSubType,	// blunt, sharp, ranged etc.
		width,			// width in inventory
		height,			// height in inventory
		itemLevel,
		
		title,			// item title as string e.g. "Breath of the Dying", "Grim Slippers" etc.
		name,			// item name as string e.g. "Leather Cap", "Buckler" etc.
		sprite,			// sprite reosource for item e.g. spr_LeatherCap, spr_Buckler etc.
		object,			// object resource for item e.g. obj_LeatherCap, obj_Buckler etc.
		
		defence,		// armor base defence
		minDamage,		// min weapon damage
		maxDamage,		// max weapon damage
		
		reqStrength,	// requirements
		reqDexterity,
		reqIntelligence,
		reqLevel,
		
		socketed,		// true or false is the item socketed?
		maxSockets,		// max sockets allowed for the item
		sockets,		// number of sockets the item has
		socketsUsed,	// how many sockets have been filled on the item?
		socket1,		// reference to what item is stored in what socket
		socket2,		
		socket3,
		socket4,
		socket5,
		
		ethereal,		// true or false is the item ethereal?
		
		identified,		// is the object identified?
		unidtooltip,	// if it's unidentified, what does the tooltip read
		tooltip,		// if it is identified, what does the tooltip read
	
		prop1stat,		
		prop1statText,	
		prop1value,		
		prop1string,	
		
		prop2stat,
		prop2statText,
		prop2value,
		prop2string,
		
		prop3stat,
		prop3statText,
		prop3value,
		prop3string,
		
		prop4stat,
		prop4statText,
		prop4value,
		prop4string,
		
		prop5stat,
		prop5statText,
		prop5value,
		prop5string,
		
		prop6stat,
		prop6statText,
		prop6value,
		prop6string,
		
		prop7stat,
		prop7statText,
		prop7value,
		prop7string,
		
		prop8stat,
		prop8statText,
		prop8value,
		prop8string,
		
		prop9stat,
		prop9statText,
		prop9value,
		prop9string,
		
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
		classString,
		hardcore,
		sprite,
		
		currentHealth,
		maxHealth,
		currentMana,
		maxMana,
		
		level,
		expCurrent,
		expNextLevel,
		statPoints,
		skillPoints,
		
		attackRating,
		minDamageBase,
		maxDamageBase,
		minDamageAdded,
		maxDamageAdded,
		
		defence,
		damageReduction,
		
		strength,
		dexterity,
		vitality,
		intelligence,
		
		fireResist,
		coldResist,
		lightningResist,
		poisonResist,
		
		magicFind,
		goldFind,
		
		MAX
	}