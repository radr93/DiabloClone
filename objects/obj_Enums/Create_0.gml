/// @description Initialize all enums
/*
-----------------\
Table of Contents |
-----------------/
1.0	Items
	1.1 Rarities
	1.2	Item Types
	1.3 Armor Types
	1.4 Weapon Types
	1.5 Misc Types
	1.6 Item Properties
2.0 Player
    2.1 Classes
	2.2 Stats
3.0 Databases
	3.1 Item Database
		3.1.1 Armor Database	(armor.csv)
		3.1.2 Weapons Database	(weapons.csv)
		3.1.3 Misc Database		(misc.csv)
	3.2 Treasure Class Database
		3.2.1 Treasure Class Master	(tcMaster.csv )
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
		misc
	}
	
	// 1.3 Armor Types
	enum armor{
		head,
		chest,
		shield,
		hands,
		belt,
		feet,
		MAX
	}
	
	// 1.4 Weapon Types
	enum weapon{
		axe,
		bow,
		crossbow,
		dagger,
		javelin,
		mace,
		polearm,
		spear,
		staff,
		sword,
		wand,
		
		MAX
	}
	
	// 1.5 Misc Types
	enum misc{
		gold,
		potion,
		neck,
		ring,
		rune
	}

	// 1.6 Item Properties
	// All properties for items
	enum property{
		rarity,			// normal, magic, rare, unique
		type,			// armor, weapon,misc
		subType,		// weapon.axe, weapon.sword, armor.head, armor.chest, misc.neck, misc.ring, etc.
		treasureClass,
		
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
	// All stats kept track of in obj_PlayerController - some are used in item property generation
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
		
		socketed,		// All from socketed and below are used for ease of item property generation
		requirements,	
		allSkills,		
		
		MAX
	}
	
// 3.0 Databases ////////
	// 3.1 Item Database
		// 3.1.1 Armor Database
		// The header of each column in armor.csv
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
		// 3.1.2 Weapon Database
		// The header of each column in armor.csv
		enum wdb{
			name,
			tc,
			type,
			subtype,
			sprite,
			width,
			height,
			maxDurability,
			twoHanded,
			attackSpeed,
			minDamage,
			maxDamage,
			reqStrength,
			reqDexterity,
			reqIntelligence,
			reqLevel,
			maxSockets,

			MAX
		}
		// 3.1.3 Misc Database
		// The header of each column in armor.csv
		enum mdb{
			name,	
			tc,	
			rarity,	
			type,	
			subtype,	
			sprite,	
			subTitle,	
			width,	
			height,	
			reqLevel,	
			
			magic1stat, magic1value, magic1string,	
			magic2stat,	magic2value, magic2string,	
			magic3stat,	magic3value, magic3string,
			magic4stat,	magic4value, magic4string,


			MAX
		}
	// 3.2 Treasure Class Database
		// 3.2.1 Treasure Class Master
		// tcMaster.csv column indexes
		enum tcmColumn{
			treasureClass,
			level,
			picks,
			noDrop,
			choice1,prob1,	choice2,prob2,	choice3,prob3,	choice4,prob4,	choice5,prob5,
			choice6,prob6,	choice7,prob7,	choice8,prob8,	choice9,prob9,	choice10,prob10,
			sumChoices,
			totalProb,
			MAX
		}