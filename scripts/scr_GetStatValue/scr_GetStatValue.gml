/*

Syntax:
scr_GetStatValue(stat, iLvl);

stat	The stat to get a value for
type	The type of the item to get a value for
subtype	The subtype of the item to get a value for
iLvl	The iLvl of the item


This script returns a value based on the of the stat/iLvl that were passed as an argument

e.g. stat.strength with iLvl 10 becomes (10-15) <-- the allowed range for that iLvl

*/

var _stat, _type, _subType, iLvl, choice;
_stat = argument0;
_type = argument1;
_subType = argument2;
iLvl = argument3;

// Find the stat to get a value for
switch _stat{
	// +x to Max Mana
	case stat.maxMana:
		// Armor
		if (_type == type.armor){
			if (_subType != armor.hands and _subType != armor.feet){
				if (iLvl >= 1) { choice = irandom_range(1, 5) }
				// Belts Only
				if (_subType == armor.belt){
					if(iLvl <= 13) { choice = irandom_range(6, 10) }
					else if(iLvl >= 14 and iLvl <= 19) { choice = irandom_range(11, 20) }
					else if(iLvl >= 20) { choice = irandom_range(21, 30) }
				}
				// Shields Only
				else if (_subType == armor.shield){
					if(iLvl <= 13) { choice = irandom_range(6, 10) }
					else if(iLvl >= 14) { choice = irandom_range(11, 20) }
				}
			}
			// Feet, Hands or Chest
			else if (_subType == armor.feet or _subType == armor.hands or _subType == armor.chest){
				if(iLvl <= 51) { choice = irandom_range(11, 20) }
				else if(iLvl >= 52) { choice = irandom_range(31, 40) }
			}
		}
		// Weapons
		else if (_type == type.weapon){
			if(iLvl >= 37) { choice = irandom_range(11, 20) }
		}
		// Jewelry
		else if (_type == type.misc){
			if(iLvl <= 5) { choice = irandom_range(1, 5) }
			else if(iLvl >= 6 and iLvl <= 13) { choice = irandom_range(6, 10) }
			else if(iLvl >= 14 and iLvl <= 19) { choice = irandom_range(11, 20) }
			else if(iLvl >= 20 and iLvl <= 23) { choice = irandom_range(21, 30) }
			else if(iLvl >= 24 and iLvl <= 29) { choice = irandom_range(31, 40) }
			else if(iLvl >= 30 and iLvl <= 36) { choice = irandom_range(41, 60) }
			else if(iLvl >= 37 and iLvl <= 44) { choice = irandom_range(61, 90) }
			else if(iLvl >= 45) { choice = irandom_range(91, 120) }
		}
		return(choice);
	// +x to (core stat)
	case stat.strength:
	case stat.dexterity:
	case stat.vitality:
	case stat.intelligence:
		choice = irandom_range(1, 3);
		switch _type{
			// Armor
			case type.armor:
				switch _subType{
					// Belt Only
					case armor.belt:
						if(iLvl >= 10 and iLvl <= 25) { choice = irandom_range(4, 6) }
						else if(iLvl >= 26 and iLvl <= 42) { choice = irandom_range(7, 9) }
						else if(iLvl >= 43 and iLvl <= 57) { choice = irandom_range(10, 15) }
						else if(iLvl >= 58 and iLvl <= 70) { choice = irandom_range(16, 20) }
						else if(iLvl >= 71) { choice = irandom_range(21, 30) }
					// Chest Only
					case armor.chest:
						if(iLvl >= 21 and iLvl <= 37) { choice = irandom_range(4, 6) }
						else if(iLvl >= 38 and iLvl <= 54) { choice = irandom_range(7, 9) }
						else if(iLvl >= 55 and iLvl <= 73) { choice = irandom_range(10, 15) }
						else if(iLvl >= 74) { choice = irandom_range(16, 20) }
					// Hands Only
					case armor.hands:
						if(iLvl >= 33 and iLvl <= 44) { choice = irandom_range(4, 6) }
						else if(iLvl >= 45 and iLvl <= 58) { choice = irandom_range(7, 9) }
						else if(iLvl >= 59) { choice = irandom_range(10, 15) }
					// Shield Only
					case armor.shield:
						if(iLvl >= 33 and iLvl <= 44) { choice = irandom_range(4, 6) }
						else if(iLvl >= 45 and iLvl <= 58) { choice = irandom_range(7, 9) }
				}
			// Weapon
			case type.weapon:
				if(iLvl >= 10 and iLvl <= 25) { choice = irandom_range(4, 6) }
				else if(iLvl >= 26 and iLvl <= 42) { choice = irandom_range(7, 9) }
				else if(iLvl >= 43 and iLvl <= 57) { choice = irandom_range(10, 15) }
				else if(iLvl >= 58 and iLvl <= 70) { choice = irandom_range(16, 20) }
				else if(iLvl >= 71) { choice = irandom_range(21, 30) }
			// Jewelry
			case type.misc:
				// Neck Only
				if (_subType == misc.neck){
					if(iLvl >= 10 and iLvl <= 25) { choice = irandom_range(4, 6) }
					else if(iLvl >= 26 and iLvl <= 42) { choice = irandom_range(7, 9) }
					else if(iLvl >= 43 and iLvl <= 57) { choice = irandom_range(10, 15) }
					else if(iLvl >= 58 and iLvl <= 70) { choice = irandom_range(16, 20) }
					else if(iLvl >= 71) { choice = irandom_range(21, 30) }
				}
				// Ring Only
				else if (_subType == misc.ring){
					if(iLvl >= 21 and iLvl <= 37) { choice = irandom_range(4, 6) }
					else if(iLvl >= 38 and iLvl <= 54) { choice = irandom_range(7, 9) }
					else if(iLvl >= 55 and iLvl <= 73) { choice = irandom_range(10, 15) }
					else if(iLvl >= 74) { choice = irandom_range(16, 20) }
				}
		}
		return(choice);
	// +x to Attack Rating
	case stat.attackRating:
		if(iLvl <= 3) { choice = irandom_range(10,20); }
		else if(iLvl >= 4 and iLvl <= 7) { choice = irandom_range(21,40); }
		else if(iLvl >= 8 and iLvl <= 12) { choice = irandom_range(41,60); }
		else if(iLvl >= 13 and iLvl <= 17) { choice = irandom_range(61,80); }
		else if(iLvl >= 18 and iLvl <= 21) { choice = irandom_range(81,100); }
		else if(iLvl >= 22) { choice = irandom_range(101,120); }
			// Weapons Only
			if (_type == type.weapon){
				if(iLvl >= 27) { choice = irandom_range(121, 150); }
				else if (iLvl >= 32 and iLvl <= 36) { choice = irandom_range(151, 300);	}
				else if (iLvl >=  37) {	choice = irandom_range(301, 450); }
			}
		return(choice);
	// +x% Enhanced Damage
	case stat.enhancedDamage:
		if(iLvl <= 4) { choice = irandom_range(10, 20) }
		else if(iLvl >= 5 and iLvl <= 7) { choice = irandom_range(21, 30) }
		else if(iLvl >= 8 and iLvl <= 13) { choice = irandom_range(31, 40) }
		else if(iLvl >= 14 and iLvl <= 19) { choice = irandom_range(41, 50) }
		else if(iLvl >= 20 and iLvl <= 25) { choice = irandom_range(51, 65) }
		else if(iLvl >= 26 and iLvl <= 31) { choice = irandom_range(66, 80) }
		else if(iLvl >= 32 and iLvl <= 40) { choice = irandom_range(81, 100) }
		else if(iLvl >= 41 and iLvl <= 55) { choice = irandom_range(101, 200) }
		else if(iLvl >= 56) { choice = irandom_range(101, 200) }
		return(choice);
	// Ignores Target Defence
	case stat.ignoreDefence:
		return(1);
	// Knocks the Target Back
	case stat.knockback:
		return(1);
	// Prevents Monster Heal
	case stat.preventHeal:
		return(1);
	// x% Life Stolen per Hit
	case stat.lifeSteal:
		// Hands Only
		if (_type == type.armor and _subType == armor.hands){
			choice = irandom_range(2, 4);
		}
		// Weapons
		if (_type == type.weapon){
			if(iLvl <= 19) { choice = irandom_range(2, 4) }
			else if(iLvl >= 20 and iLvl <= 55) { choice = irandom_range(5, 7) }
			else if(iLvl >= 56) { choice = irandom_range(8, 10) }
		}
		// Jewelry
		else if (_type == type.misc){
			// Neck Only
			if (_subType == misc.neck){
				if(iLvl <= 56) { choice = irandom_range(2, 4) }
				else if(iLvl >= 57 and iLvl <= 84) { choice = irandom_range(5, 7) }
				else if(iLvl >= 85) { choice = irandom_range(8, 10) }
			}
			else if (_subType == misc.ring){
				if(iLvl <= 46) { choice = irandom_range(2, 4) }
				else if(iLvl >= 47 and iLvl <= 77) { choice = irandom_range(5, 7) }
				else if(iLvl >= 78) { choice = irandom_range(8, 10) }
			}
		}
		return(choice);
	// x% Mana Stolen per Hit
	case stat.manaSteal:
		// Hands Only
		if (_type == type.armor and _subType == armor.hands){
			choice = irandom_range(2, 4);
		}
		// Weapons
		if (_type == type.weapon){
			if(iLvl <= 19) { choice = irandom_range(2, 4) }
			else if(iLvl >= 20 and iLvl <= 55) { choice = irandom_range(5, 7) }
			else if(iLvl >= 56) { choice = irandom_range(8, 10) }
		}
		// Jewelry
		else if (_type == type.misc){
			// Neck Only
			if (_subType == misc.neck){
				if(iLvl <= 56) { choice = irandom_range(2, 4) }
				else if(iLvl >= 57 and iLvl <= 84) { choice = irandom_range(5, 7) }
				else if(iLvl >= 85) { choice = irandom_range(8, 10) }
			}
			// Ring Only
			else if (_subType == misc.ring){
				if(iLvl <= 46) { choice = irandom_range(2, 4) }
				else if(iLvl >= 47 and iLvl <= 77) { choice = irandom_range(5, 7) }
				else if(iLvl >= 78) { choice = irandom_range(8, 10) }
			}
		}
		return(choice);
	// +x% to Movement Speed
	case stat.movementSpeed:
		if(iLvl <= 11) { choice = irandom_range(1, 2)}
		else if(iLvl >= 12 and iLvl <= 21) { choice = irandom_range(3, 5) }
		else if(iLvl >= 22 and iLvl <= 36) { choice = irandom_range(6, 9) }
		else if(iLvl >= 37 and iLvl <= 64) { choice = irandom_range(10, 14) }
		else if(iLvl >= 65) { choice = irandom_range(15, 20) }
	// +% Increased Attack Speed
	case stat.attackSpeed:
		// Hands Only
		if (_type == type.armor and _subType == armor.hands){
			if(iLvl <= 42) { choice = 10 }
			else if(iLvl >= 43) { choice = 20 }
		}
		// Weapons
		else if (_type == type.weapon){
			if(iLvl <= 24) { choice = 10 }
			else if(iLvl >= 25 and iLvl <= 33) { choice = 20 }
			else if(iLvl >= 34 and iLvl <= 45) { choice = 30 }
			else if(iLvl >= 46) { choice = 40 }
		}
		return(choice);
	// +x% Faster Cast Rate
	case stat.castRate:
		// Necks Only
		if (_type == type.misc and _subType == misc.neck){
			if(iLvl <= 34) { choice = 10; }
			else if(iLvl >= 35) { return(20); }
		}
		// Rings Only
		else if (_type == type.misc and _subType == misc.ring){
			if(iLvl <= 54) { choice = 10; }
			else if(iLvl >= 55) { choice = 20; }
		}
		return(choice);
	// x to Min Damage	
	case stat.minDamage:
		// Weapons
		if (_type == type.weapon){
			if(iLvl <= 11) { choice = irandom_range(1, 2)}
			else if(iLvl <= 23) { choice = irandom_range(3, 5) }
			else if(iLvl >= 24 and iLvl <= 47) { choice = irandom_range(6, 9) }
			else if(iLvl >= 48 and iLvl <= 75) { choice = irandom_range(10, 14) }
			else if(iLvl >= 76) { choice = irandom_range(15, 20) }
		}
		// Jewelry
		else if (_type == type.misc){
			if(iLvl <= 36) { choice = irandom_range(1, 2)}
			else if(iLvl >= 37 and iLvl <= 58) { choice = irandom_range(3, 5) }
			else if(iLvl >= 59) { choice = irandom_range(6, 9) }
		}
		return(choice);
	// x to Max Damage
	case stat.maxDamage:
		// Weapons
		if (_type == type.weapon){
			if(iLvl <= 3) { choice = 1}
			else if(iLvl >= 4 and iLvl <= 6) { choice = 2 }
			else if(iLvl >= 7 and iLvl <= 10) { choice = irandom_range(3, 4) }
			else if(iLvl >= 11 and iLvl <= 13) { choice = irandom_range(5, 7) }
			else if(iLvl >= 14 and iLvl <= 18) { choice = irandom_range(8, 10) }
			else if(iLvl >= 19 and iLvl <= 24) { choice = irandom_range(11, 14) }
			else if(iLvl >= 25 and iLvl <= 34) { choice = irandom_range(15, 20) }
			else if(iLvl >= 35 and iLvl <= 44) { choice = irandom_range(21, 40) }
			else if(iLvl >= 45) { choice = irandom_range(41, 63) }
		}
		// Jewelry
		else if (_type == type.misc){
			if (iLvl <= 41) { choice = 1 }
			else if (iLvl >= 42) { choice = irandom_range(3, 4) }
		}
		return(choice);
	// Elemental Damage
	case stat.fireDamage:
		if(iLvl <= 34) { choice = irandom_range(1,25); }
		else if(iLvl >= 35 and iLvl <= 46) { choice = irandom_range(26,50); }
		else if(iLvl >= 47 and iLvl <= 60) { choice = irandom_range(51,80); }
		else if(iLvl >= 61 and iLvl <= 76) { choice = irandom_range(81,120); }
		else if(iLvl >= 77) { choice = irandom_range(121,170); }
		return(choice);
	case stat.coldDamage:
		if(iLvl <= 34) { choice = irandom_range(6,9); }
		else if(iLvl >= 35 and iLvl <= 49) { choice = irandom_range(10,15); }
		else if(iLvl >= 50 and iLvl <= 74) { choice = irandom_range(16,23); }
		else if(iLvl >= 75) { choice = irandom_range(24,45); }
		return(choice);
	case stat.lightningDamage:
		choice = 1;
		return(choice);
	case stat.poisonDamage:
		if(iLvl <= 9) { choice = 6; }
		else if(iLvl >= 10 and iLvl <= 19) { choice = 12; }
		else if(iLvl >= 20 and iLvl <= 34) { choice = 60; }
		else if(iLvl >= 35 and iLvl <= 49) { choice = 90; }
		else if(iLvl >= 50) { choice = 165; }
		return(choice);
	// +x% Enhanced Defence
	case stat.enhancedDefence:
		if(iLvl <= 3) { choice = irandom_range(10,30); }
		else if(iLvl >= 4 and iLvl <= 8) { choice = irandom_range(21,30); }
		else if(iLvl >= 9 and iLvl <= 18) { choice = irandom_range(31,40); }
		else if(iLvl >= 19 and iLvl <= 25) { choice = irandom_range(41,50); }
		else if(iLvl >= 26 and iLvl <= 30) { choice = irandom_range(51,65); }
		else if(iLvl >= 31 and iLvl <= 35) { choice = irandom_range(66,80); }
		else if(iLvl >= 36 and iLvl <= 49) { choice = irandom_range(81,100); }
		else if(iLvl >= 50) { choice = irandom_range(101,200); }
		return(choice);
	// % Increased Chance of Blocking
	case stat.blockChance:
		if(iLvl <= 10) { choice = 10; }
		else if(iLvl >= 11) { choice = 20; }
		return(choice);
	// Damage Reduced by x
	case stat.damageReduction:
		// Armor
		if (_type == type.armor){
			// Chest or Shield
			if (_subType == armor.chest or _subType == armor.shield){
				if(iLvl <= 23) { choice = 1 }
				else if(iLvl >= 24 and iLvl <= 32) { choice = 2 }
				else if(iLvl >= 33 and iLvl <= 40) { choice = 3 }
				else if(iLvl >= 41 and iLvl <= 50) { choice = irandom_range(4, 7) }
				else if(iLvl >= 51) { choice = irandom_range(8, 15) }
			}
		}
		// Jewelry
		else if (_type == type.misc){
			// Necks Only
			if (_subType == misc.neck){
				if(iLvl <= 17) { choice = 1 }
				else if(iLvl >= 18 and iLvl <= 25) { choice = 2 }
				else if(iLvl >= 26 and iLvl <= 34) { choice = 3 }
				else if(iLvl >= 35 and iLvl <= 44) { choice = irandom_range(4, 7) }
				else if(iLvl >= 45) { choice = irandom_range(10, 15) }
			}
			// Rings Only
			else if (_subType == misc.ring){
				if(iLvl <= 17) { choice = 1 }
				else if(iLvl >= 18) { choice = 2 }
			}
		}
		return(choice);
	// +x% Faster Hit Recovery
	case stat.hitRecovery:
		// Armor
		if(_type == type.armor and iLvl >= 5){
			choice = 10;
			// Belt, Chest or Shield
			if (_subType == armor.belt or _subType == armor.chest or _subType == armor.shield){
				if(iLvl >= 9) { choice = 20; }
				// Shields Only
				if (_subType != armor.shield){
					if(iLvl >= 18) { choice = 30; }
				}
				
			}
		}
		return(choice)
	// Replenish x Health Every 5 Seconds.
	case stat.healthRegen:
		// Armor
		if (_type == type.armor){
			switch _subType{
				// Belt Only
				case armor.belt:
					if (iLvl <= 55) { choice = irandom_range(3, 5) }
					else if(iLvl >= 56) { choice = irandom_range(6, 10) }
				// Shield, Hands or Chest
				case armor.shield:				
				case armor.hands:				
				case armor.chest:
					choice = irandom_range(3, 5);					
			}
		}
		// Jewelry
		else if (_type == type.misc){
			// Neck Only
			if (_subType == misc.neck){
				if (iLvl <= 16) { choice = irandom_range(3, 5) }
				else if(iLvl >= 17 and iLvl <= 37) { choice = irandom_range(6, 10) }
				else if(iLvl >= 38) { choice = irandom_range(11, 15) }
			}
			// Ring Only
			else if (_subType == misc.ring){
				if (iLvl <= 55) { choice = irandom_range(3, 5) }
				else if(iLvl >= 56) { choice = irandom_range(6, 10) }
			}
		}
		show_debug_message("Choice was stat.healthRegen, iLvl = "+string(iLvl)+" stat value = "+string(choice));
		return(choice);
	// Replenish x% Mana Every 5 Seconds.	
	case stat.manaRegen:
		// Armor
		if (_type == type.armor){
			switch _subType{
				// Belt Only
				case armor.belt:
					if (iLvl <= 55) { choice = irandom_range(3, 5) }
					else if(iLvl >= 56) { choice = irandom_range(6, 10) }
				// Shield, Hands or Chest
				case armor.shield:				
				case armor.hands:			
				case armor.chest:
					choice = irandom_range(3, 5);					
			}
		}
		// Jewelry
		else if (_type == type.misc){
			// Neck Only
			if (_subType == misc.neck){
				if (iLvl <= 16) { choice = irandom_range(3, 5) }
				else if(iLvl >= 17 and iLvl <= 37) { choice = irandom_range(6, 10) }
				else if(iLvl >= 38) { choice = irandom_range(11, 15) }
			}
			// Ring Only
			else if (_subType == misc.ring){
				if(iLvl <= 55) { choice = irandom_range(3, 5) }
				else if(iLvl >= 56) { choice = irandom_range(6, 10) }
			}
		}
		show_debug_message("Choice was stat.manaRegen, iLvl = "+string(iLvl)+" stat value = "+string(choice));
		return(choice);
	// All Resistances +x%
	case stat.allResist:
		// Shield
		if (_type == type.armor and _subType == armor.shield){
			if(iLvl <= 17) { choice = irandom_range(3, 7); }
			else if(iLvl >= 18 and iLvl <= 27) { choice = irandom_range(8,11); }
			else if(iLvl >= 28 and iLvl <= 38) { choice = irandom_range(12,15); }
			else if(iLvl >= 39 and iLvl <= 49) { choice = irandom_range(16,20); }
			else if(iLvl >= 50) { choice = irandom_range(21,30); }
		}
		// Neck
		else if (_type == type.misc and _subType == misc.neck){
			if(iLvl <= 20) { choice = irandom_range(3, 7); }
			else if(iLvl >= 21 and iLvl <= 33) { choice = irandom_range(8,11); }
			else if(iLvl >= 34 and iLvl <= 41) { choice = irandom_range(12,15); }
			else if(iLvl >= 42 and iLvl <= 54) { choice = irandom_range(16,20); }
			else if(iLvl >= 55) { choice = irandom_range(21,30); }
		}
		// Ring
		else if (_type == type.misc and _subType == misc.ring){
			if(iLvl <= 55) { choice = irandom_range(3, 7); }
			else if(iLvl >= 56 and iLvl <= 66) { choice = irandom_range(8,11); }
			else if(iLvl >= 67) { choice = irandom_range(12,15); }
		}
		return(choice);
	// (Individual Resistance) +x%
	case stat.coldResist:
	case stat.fireResist:
	case stat.lightningResist:
	case stat.poisonResist:
		// Armor
		if (_type == type.armor){
			if(iLvl <= 11) { choice = irandom_range(5, 10) }
			else if(iLvl >= 12 and iLvl <= 17) { choice = irandom_range(11, 20) }
			else if(iLvl >= 18) { choice = irandom_range(21, 30) }
			if (_subType == armor.feet){
				if(iLvl >= 25) { choice = irandom_range(31, 40);}
			}
		}
		// Weapons
		else if (_type == type.weapon){
			if(iLvl <= 34) { choice = irandom_range(5, 10) }
			else if(iLvl >= 35 and iLvl <= 54) { choice = irandom_range(11, 20) }
			else if(iLvl >= 55) { choice = irandom_range(21, 30) }
		}
		// Jewelry
		else if (_type == type.misc){
			if(iLvl <= 11) { choice = irandom_range(5, 10) }
			else if(iLvl >= 12 and iLvl <= 17) { choice = irandom_range(11, 20) }
			else if(iLvl >= 18) { choice = irandom_range(21, 30) }
			// Necks Only
			if (_subType == misc.neck){
				if(iLvl >= 25) { choice = irandom_range(31, 40);}				
			}
		}
		return(choice);
	// Cold Length Reduced by x%
	case stat.coldLength:
		return(50)
	// Poison Length Reduced by x%
	case stat.poisonLength:
		if(iLvl <= 17) { choice = 25 }
		else if(iLvl >= 18 and iLvl <= 24) { choice = 50 }
		else if(iLvl >= 25) { choice = 75 }
		return(choice)
	// +x% Better Chance of Finding Magical Items
	case stat.magicFind:
		if(iLvl <= 11) { choice = irandom_range(1, 2)}
		else if(iLvl >= 12 and iLvl <= 15) { choice = irandom_range(3, 5) }
		else if(iLvl >= 16) { choice = irandom_range(6, 9) }
		// Neck Only
		if (_type == type.misc and _subType == misc.neck){
			if(iLvl >= 26) { choice = irandom_range(26, 35) }
		}
		// Boots Only
		else if (_type == type.armor and _subType == armor.feet){
			if(iLvl >= 26) { choice = irandom_range(26, 35) }
		}
		return(choice);
	// +x% Gold Find
	case stat.goldFind:
		if(iLvl <= 6) { choice = irandom_range(5, 20) }
		else if(iLvl >= 7 and iLvl <= 16) { choice = irandom_range(21, 40) }
		else if(iLvl >= 17) { choice = irandom_range(41, 80) }
		return(choice);
	// Socketed
	case stat.socketed:
		if(iLvl <= 32) { choice = choose(1,2); }
		else if(iLvl >= 33 and iLvl <= 54) { choice = 3; }
		else if(iLvl >= 55) { choice = 4; }
		return(choice);
	// Requirements -x%
	case stat.requirements:
		if(iLvl <= 24) { choice = 20; }
		else if(iLvl >= 25) { choice = 40; }
		return(choice);
}
return(1);
show_debug_message(	"\n### ERROR scr_GetStatValue ####\n"+
					"Did not retrieve a valid value for:\n"+
					"itemType: "+string(itemType)+"\n"+
					"itemSubType: "+string(itemSubType)+"\n"+
					"returning (1).\n");