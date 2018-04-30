/*

Syntax:
scr_GetStatString(stat, value, value2);

stat	The stat to convert to a string
value	The value of the stat to convert to a string
value2	The second value of certain stats to add to a string (-1 if not applicable)

This script returns a string of the stat/value that were passed as an argument

e.g. stat.strength with a value of 10 becomes "+10 to Strength"

*/
var _stat, value, value2;
_stat = argument0;
value = argument1;
value2 = argument2;

value = string(value);
value2 = string(value2);

switch (_stat){
	case stat.maxHealth:		return("+"+value+" to Max Health");
	case stat.maxMana:			return("+"+value+" to Max Mana");
	case stat.maxHealthPercent: return("+"+value+"% to Max Health");
	case stat.maxManaPercent:	return("+"+value+"% to Max Mana");
	
	case stat.allAttributes:	return("+"+value+" to All Attributes");
	case stat.strength:			return("+"+value+" to Strength");
	case stat.dexterity:		return("+"+value+" to Dexterity");
	case stat.vitality:			return("+"+value+" to Vitality");
	case stat.intelligence:		return("+"+value+" to Intelligence");
	
	case stat.attackRating:		return("+"+value+" to Attack Rating");
	case stat.enhancedDamage:	return(value+"% Enhanced Damage");
	case stat.ignoreDefence:	return("Ignores Target Defence");
	case stat.knockback:		return("Knockback");
	case stat.preventHeal:		return("Prevents Monster Heal");
	case stat.lifeSteal:		return(value+"% Life Stolen per Hit");
	case stat.manaSteal:		return(value+"% Mana Stolen per Hit");
	
	case stat.movementSpeed:	return(value+"% Faster Movement Speed");
	case stat.attackSpeed:		return(value+"% Increased Attack Speed");
	case stat.castRate:			return(value+"% Faster Cast Rate");
	case stat.minDamage:		return("Minimum Damage increased by "+value);
	case stat.maxDamage:		return("Maximum Damage increased by "+value);
	case stat.fireDamage:		return("Adds "+value+"-"+value2+" Fire Damage");
	case stat.coldDamage:		return("Adds "+value+"-"+value2+" Cold Damage");
	case stat.lightningDamage:	return("Adds "+value+"-"+value2+" Lightning Damage");
	case stat.poisonDamage:		return("Inflict "+value+" Poison Damage Over 3 Seconds");
	
	case stat.defence:					return(value+" Bonus Defence");
	case stat.enhancedDefence:			return(value+"% Enhanced Defence");
	case stat.blockChance:				return("+"+value+"% Increased Chance of Blocking");
	case stat.damageReduction:			return("Damage Reduced by "+value);
	case stat.damageReductionPercent:	return("Damage Reduced by "+value+"%");
	case stat.hitRecovery:				return(value+"% Faster Hit Recovery");
	case stat.healthRegen:				return("Regenerates "+value+" Health per Second");
	case stat.manaRegen:				return("Regenerates "+value+" Mana per Second");
	
	case stat.allResist:			return("All Resistances +"+value+"%");
	case stat.fireResist:			return("Fire Resist +"+value+"%");
	case stat.coldResist:			return("Cold Resist +"+value+"%");
	case stat.lightningResist:		return("Lightning Resist +"+value+"%");
	case stat.poisonResist:			return("Poison Resist +"+value+"%");
	case stat.fireResistMax:		return("+"+value+"% to Maxmimum Fire Resist");
	case stat.coldResistMax:		return("+"+value+"% to Maximum Cold Resist");
	case stat.lightningResistMax:	return("+"+value+"% to Maximum Lightning Resist");
	case stat.poisonResistMax:		return("+"+value+"% to Maximum Poison Resist");
	
	case stat.coldLength:		return("Reduces the Duration of Cold Effects by 50%");
	case stat.poisonLength:		return("Reduces the Duration of Poison by "+value+"%");
	
	case stat.goldFind:			return(value+"% More Gold Dropped From Monsters");	
	case stat.magicFind:		return(value+"% Better Chance of Finding Magical Items");
	
	case stat.socketed:			return("Socketed("+value+") (This shouldn't show up)");
	case stat.requirements:		return("Requirements -"+value+"%");
	case stat.allSkills:		return("+"+value+" to All Skills");
}
show_debug_message(	"\n### ERROR scr_GetStatString line 72 ####\n"+
					"Did not retrieve a valid string for:\n"+
					"stat: "+string(_stat)+"\n\n");
return(" BROKEN ");