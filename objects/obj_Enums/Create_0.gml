/// @description Initialize all enums
/*
-----------------\
Table of Contents |
-----------------/
1.0	Items
	1.1 Rarities
	1.2	Item Types
	1.3 Weapon Types
	1.4 Armor Types
	1.5 Jewelry Types
	1.6 Misc Types
	1.7 Item Properties
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
		armor,
		weapon,
		jewelry,
		misc
	}
	
	// 1.3 Weapon Types
	enum weapon{
		sword,
		axe,
		mace,
		bow,
		polearm,
		MAX
	}
	
	// 1.4 Armor Types
	enum armor{
		head,
		chest,
		shield,
		hands,
		belt,
		feet,
		MAX
	}
	
	// 1.5 Jewelry Types
	enum jewelry{
		ring,
		neck,
		MAX
	}
	
	// 1.6 Misc Types
	enum misc{
		gold,
		potion,
		rune
	}

	// 1.7 Item Properties
	// Used to hold values for item properties in inventory/item held/ground item arrays
	enum property{
		rarity,			// normal, magic, rare, unique
		type,			// armor, weapon, jewelry, misc
		subType,		// weapon.axe, weapon.sword, armor.head, armor.chest, misc.potion, etc.
		qLvl,
		
		title,			// item title as string e.g. "Breath of the Dying", "Grim Slippers" etc.
		prefix,			// item's magical prefix (if any) as string e.g. "Boar's", "Thief's" etc.
		name,			// item name as string e.g. "Leather Cap", "Buckler" etc.
		suffix,			// item's magical suffix (if any) as string e.g. " of the Bear", " of Death" etc.
		subTitle,		// item's subtitle (if any) as string e.g. "Ah, Beh, Ceh", "Used to socket items", "Opens Chests"
		sprite,			// sprite resource for item e.g. spr_LeatherCap, spr_Buckler etc.
		width,			// width in inventory
		height,			// height in inventory
		itemLevel,		// the item's level
		object,
		
		durability,
		maxDurability,
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
		
		ethereal,		// true or false is the item ethereal?
		
		identified,		// is the object identified?
		unidtooltip,	// if it's unidentified, what does the tooltip read
		tooltip,		// if it is identified, what does the tooltip read
		
		magic1stat, magic1value, magic1value2, magic1string,		
		magic2stat, magic2value, magic2value2, magic2string,
		magic3stat, magic3value, magic3value2, magic3string,
		magic4stat, magic4value, magic4value2, magic4string,
		magic5stat, magic5value, magic5value2, magic5string,
		magic6stat, magic6value, magic6value2, magic6string,
		
		socket1item, socket1stat, socket1value, socket1string,		
		socket2item, socket2stat, socket2value, socket2string,
		socket3item, socket3stat, socket3value, socket3string,
		socket4item, socket4stat, socket4value, socket4string,
		socket5item, socket5stat, socket5value, socket5string,
		socket6item, socket6stat, socket6value, socket6string,
		
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
		gold,
		
		currentHealth,
		maxHealth,
		currentMana,
		maxMana,
		maxHealthPercent,
		maxManaPercent,
		
		level,
		expCurrent,
		expNextLevel,
		statPoints,
		skillPoints,
		
		allAttributes,
		strength,
		dexterity,
		vitality,
		intelligence,
		
		attackRating,
		enhancedDamage,
		ignoreDefence,
		knockback,
		preventHeal,
		lifeSteal,
		manaSteal,
		
		movementSpeed,
		attackSpeed,
		castRate,
		minDamage,
		maxDamage,
		fireDamage,
		fireDamageMax,
		coldDamage,
		coldDamageMax,
		lightningDamage,
		lightningDamageMax,
		poisonDamage,
		poisonDamageMax,
		
		defence,
		enhancedDefence,
		blockChance,
		damageReduction,
		damageReductionPercent,
		hitRecovery,
		healthRegen,
		manaRegen,
		
		allResist,
		fireResist,
		coldResist,
		lightningResist,
		poisonResist,
		fireResistMax,
		coldResistMax,
		lightningResistMax,
		poisonResistMax,
		
		coldLength,
		poisonLength,
		
		magicFind,
		goldFind,
		
		socketed,
		requirements,
		allSkills,
		
		MAX
	}