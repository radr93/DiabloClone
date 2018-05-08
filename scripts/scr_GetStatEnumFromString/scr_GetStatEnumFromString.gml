/*

Syntax:
scr_GetStatEnumFromString(stat, value, value2));

stat	The stat to convert to an enum (as a string)

This script returns the enum of the stat/value that were passed as an argument

e.g. "strength" becomes stat.strength

*/

var _stat = argument0;

switch (_stat){
	case "maxHealth":			return(stat.maxHealth);
	case "maxMana":				return(stat.maxMana);
	case "maxHealthPercent":	return(stat.maxHealthPercent);
	case "maxManaPercent":		return(stat.maxManaPercent);
	
	case "allAttributes":		return(stat.allAttributes);
	case "strength":			return(stat.strength);
	case "dexterity":			return(stat.dexterity);
	case "vitality":			return(stat.vitality);
	case "intelligence":		return(stat.intelligence);
	
	case "attackRating":		return(stat.attackRating);
	case "enhancedDamage":		return(stat.enhancedDamage);
	case "ignoreDefence":		return(stat.ignoreDefence);
	case "knockback":			return(stat.knockback);
	case "preventHeal":			return(stat.preventHeal);
	case "lifeSteal":			return(stat.lifeSteal);
	case "manaSteal":			return(stat.manaSteal);
	
	case "movementSpeed":		return(stat.movementSpeed);
	case "attackSpeed":			return(stat.attackSpeed);
	case "castRate":			return(stat.castRate);
	case "minDamage":			return(stat.minDamage);
	case "maxDamage":			return(stat.maxDamage);
	case "fireDamage":			return(stat.fireDamage);
	case "coldDamage":			return(stat.coldDamage);
	case "lightningDamage":		return(stat.lightningDamage);
	case "poisonDamage":		return(stat.poisonDamage);
	
	case "defence":					return(stat.defence);
	case "enhancedDefence":			return(stat.enhancedDefence);
	case "blockChance":				return(stat.blockChance);
	case "damageReduction":			return(stat.damageReduction);
	case "damageReductionPercent":	return(stat.damageReductionPercent);
	case "hitRecovery":				return(stat.hitRecovery);
	case "healthRegen":				return(stat.healthRegen);
	case "manaRegen":				return(stat.manaRegen);
	
	case "allResist":			return(stat.allResist);
	case "fireResist":			return(stat.fireResist);
	case "coldResist":			return(stat.coldResist);
	case "lightningResist":		return(stat.lightningResist);
	case "poisonResist":		return(stat.poisonResist);
	case "fireResistMax":		return(stat.fireResistMax);
	case "coldResistMax":		return(stat.coldResistMax);
	case "lightningResistMax":	return(stat.lightningResistMax);
	case "poisonResistMax":		return(stat.poisonResistMax);
	
	case "coldLength":			return(stat.coldLength);
	case "poisonLength":		return(stat.poisonLength);
	
	case "goldFind":			return(stat.goldFind);
	case "magicFind":			return(stat.magicFind);
	
	case "socketed":			return(stat.socketed);
	case "requirements":		return(stat.requirements);
	case "allSkills":			return(stat.allSkills);
}
show_debug_message(	"\n### ERROR scr_GetStatString line 82 ####\n"+
					"Did not retrieve a valid string for:\n"+
					"stat: "+string(_stat)+"\n\n");
return(undefined);