/*

Syntax:
scr_GetSuffixText(stat);

stat	The stat to convert to a string
value	The value of the stat to convert to a string

This script returns a suffix as a string that corresponds with the
stat/value that were passed as an argument

e.g. stat.damageReduction with a value of 2 becomes " of Protection"

*/

var _stat = argument0;
var value = argument1;

var _stat = argument0;
var value = argument1;

switch (_stat){
	case stat.strength:
			 if (value <= 3) { return(" of Strength"); }
		else if (value >= 4 and value <= 6) { return(" of Might"); }
		else if (value >= 7 and value <= 9) { return(" of the Ox"); }
		else if (value >= 10 and value <= 15) { return(" of the Giant"); }
		else if (value >= 15 and value <= 20) { return(" of the Titan"); }
		else if (value >= 21) { return(" of Atlas"); }
	case stat.dexterity:
			 if (value <= 3) { return(" of Dexterity"); }
		else if (value >= 4 and value <= 6) { return(" of Skill"); }
		else if (value >= 7 and value <= 9) { return(" of Accuracy"); }
		else if (value >= 10 and value <= 15) { return(" of Precision"); }
		else if (value >= 15 and value <= 20) { return(" of Perfection"); }
		else if (value >= 21) { return(" of Nirvana"); }
	case stat.vitality:
			 if (value <= 3) { return(" of the Jackal"); }
		else if (value >= 4 and value <= 6) { return(" of the Fox"); }
		else if (value >= 7 and value <= 9) { return(" of the Wolf"); }
		else if (value >= 10 and value <= 15) { return(" of the Tiger"); }
		else if (value >= 15 and value <= 20) { return(" of the Colossus"); }
		else if (value >= 21) { return(" of Hope"); }
	case stat.intelligence:
			 if (value <= 3) { return(" of Intelligence"); }
		else if (value >= 4 and value <= 6) { return(" of the Mind"); }
		else if (value >= 7 and value <= 9) { return(" of Brilliance"); }
		else if (value >= 10 and value <= 15) { return(" of Sorcery"); }
		else if (value >= 15 and value <= 20) { return(" of Wizardry"); }
		else if (value >= 21) { return(" of Enlightenment"); }
		
	case stat.ignoreDefence:
		return(" of Piercing");
	case stat.knockback:
		return(" of the Bear");
	case stat.preventHeal:
		return(" of Vileness");
	case stat.lifeSteal:
			 if (value <= 4) { return(" of the Locust"); }
		else if (value >= 5 and value <= 7) { return(" of the Leech"); }
		else if (value >= 8) { return(" of the Vampire"); }
	case stat.manaSteal:
			 if (value <= 4) { return(" of the Bat"); }
		else if (value >= 5 and value <= 7) { return(" of the Lamprey"); }
		else if (value >= 8) { return(" of the Wraith"); }
	
	case stat.movementSpeed:
			 if (value == 5) { return(" of Inertia"); }
		else if (value == 10) { return(" of Pacing"); }
		else if (value == 20) { return(" of Haste"); }
		else if (value == 30) { return(" of Speed"); }
		else if (value == 40) { return(" of Acceleration"); }
	case stat.attackSpeed:
			 if (value == 10) { return(" of Readiness"); }
		else if (value == 20) { return(" of Swiftness"); }
		else if (value == 30) { return(" of Quickness"); }
		else if (value == 40) { return(" of Alacrity"); }
	case stat.castRate:
			 if (value == 10) { return(" of the Apprentice"); }
		else if (value == 20) { return(" of the Magus"); }
	case stat.minDamage:
			 if (value == 1) { return(" of Craftsmanship"); }
		else if (value == 2) { return(" of Quality"); }
		else if (value == 3 or value == 4) { return(" of Maiming"); }
		else if (value >= 5 and value <= 7) { return(" of Slaying"); }
		else if (value >= 8 and value <= 10) { return(" of Gore"); }
		else if (value >= 11 and value <= 14) { return(" of Carnage"); }
		else if (value >= 15 and value <= 20) { return(" of Slaughter"); }
		else if (value >= 21 and value <= 40) { return(" of Butchery"); }
		else if (value >= 41) { return(" of Evisceration"); }
	case stat.maxDamage:
			 if (value <= 2) { return(" of Worth"); }
		else if (value >= 3 and value <= 5) { return(" of Measure"); }
		else if (value >= 6 and value <= 9) { return(" of Excellence"); }
		else if (value >= 10 and value <= 14) { return(" of Performance"); }
		else if (value >= 15) { return(" of Transcendence"); }
	
	case stat.blockChance:
			 if (value == 10) { return(" of Blocking"); }
		else if (value == 20) { return(" of Deflecting"); }
	case stat.damageReduction:
			 if (value == 1) { return(" of Health"); }
		else if (value == 2) { return(" of Protection"); }
		else if (value == 3) { return(" of Absorption"); }
		else if (value >= 4 and value <= 7) { return(" of Life"); }
		else if (value >= 8 and value <= 15) { return(" of Amierae"); }
		else if (value >= 16) { return(" of Life Everlasting"); }
	case stat.hitRecovery:
			 if (value == 10) { return(" of Stability"); }
		else if (value == 20) { return(" of Balance"); }
		else if (value == 30) { return(" of Equilibrium"); }
	case stat.healthRegen:
			 if (value <= 5) { return(" of Regeneration"); }
		else if (value >= 6 and value <= 10) { return(" of Regrowth"); }
		else if (value >= 11) { return(" of Revivification"); }
	case stat.manaRegen:
			 if (value <= 5) { return(" of Focus"); }
		else if (value >= 6 and value <= 10) { return(" of Mental Peace"); }
		else if (value >= 11) { return(" of the Zen Mind"); }
		
	case stat.coldLength:
		return(" of Thawing");
	case stat.poisonLength:
			 if (value == 25) { return(" of Remedy"); }
		else if (value == 50) { return(" of Amelioration"); }
		else if (value == 75) { return(" of Defiance"); }	
		
	case stat.magicFind:
			 if (value <= 5) { return(" of Prosperity"); }
		else if (value >= 6 and value <= 15) { return(" of Chance"); }
		else if (value >= 16 and value <= 25) { return(" of Good Fortune"); }
		else if (value >= 26) { return(" of Pure Luck"); }
		
	case stat.requirements:
			 if (value == 20) { return (" of Ease"); }
		else if (value == 40) { return (" of Simplicity"); }
}
show_debug_message(	"\n### ERROR scr_GetSuffixText line 138 ####\n"+
					"Did not retrieve a valid suffix string for:\n"+
					"stat: "+string(_stat)+"\n"+
					"value: "+string(value)+"\n\n");
return(" of the Broken");