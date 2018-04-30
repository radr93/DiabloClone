/*

Syntax:
scr_GetReqLevel(item);

item	The item to get the required level for


This script returns the level requirement based on the the properties the item
has rolled. Only applicable to magical and rare.

*/

var propArray, _stat, value, previousReq, levelReq;
propArray = argument0;
previousReq = -1;
levelReq = -1;

for (var i = 0; i < 6; i++){
	_stat = propArray[i,0];
	value = propArray[i,1];
	if (_stat != -1){
		switch (_stat){
			case stat.socketed:
				if (value <= 2) { previousReq = 9; }
				else if (value == 3) { previousReq = 30; }
				else if (value == 4) { previousReq = 57; }
				break;
			case stat.attackRating:
				if (value <= 20) { previousReq = 2; }
				else if (value >= 21 and value <= 40) { previousReq = 4; }
				else if (value >= 41 and value <= 60) { previousReq = 6; }
				else if (value >= 61 and value <= 80) { previousReq = 8; }
				else if (value >= 81 and value <= 100) { previousReq = 12; }
				else if (value >= 101 and value <= 120) { previousReq = 17; }
				else if (value >= 121 and value <= 150) { previousReq = 25; }
				else if (value >= 151 and value <= 300) { previousReq = 30; }
				else if (value >= 301) { previousReq = 36; }
				break;
			case stat.enhancedDefence:
				if (value <= 30) { previousReq = 3; }
				else if (value >= 31 and value <= 40) { previousReq = 8; }
				else if (value >= 41 and value <= 50) { previousReq = 18; }
				else if (value >= 51 and value <= 60) { previousReq = 24; }
				else if (value >= 61 and value <= 80) { previousReq = 32; }
				else if (value >= 81 and value <= 100){ previousReq = 37; }
				else if (value >= 101) { previousReq = 51; }
				break;
			case stat.fireDamage:
				if (value <= 25) { previousReq = 18; }
				else if (value >= 26 and value <= 50) { previousReq = 32; }
				else if (value >= 51 and value <= 80) { previousReq = 46; }
				else if (value >= 81 and value <= 120) { previousReq = 60; }
				else if (value >= 121) { previousReq = 75; }
				break;
			case stat.coldDamage:
				if (value <= 9) { previousReq = 18; }
				else if (value >= 10 and value <= 15) { previousReq = 32; }
				else if (value >= 16 and value <= 23) { previousReq = 49; }
				else if (value >= 24) { previousReq = 74; }
				break;
			case stat.lightningDamage:
				if (value <= 120) { previousReq = 18; }
				else if (value >= 121 and value <= 180) { previousReq = 31; }
				else if (value >= 181 and value <= 260) { previousReq = 45; }
				else if (value >= 261 and value <= 360) { previousReq = 59; }
				else if (value >= 361) { previousReq = 74; }
				break;
			case stat.poisonDamage:
				if (value == 6) { previousReq = 2; }
				else if (value == 12) { previousReq = 12; }
				else if (value == 60) { previousReq = 22; }
				else if (value == 90) { previousReq = 37; }
				else if (value == 165) { previousReq = 52; }
				break;
			case stat.allResist:
				if (value <= 7) { previousReq = 9; }
				else if (value >= 8 and value <= 11) { previousReq = 17; }
				else if (value >= 12 and value <= 15) { previousReq = 27; }
				else if (value >= 16 and value <= 20) { previousReq = 42; }
				else if (value >= 21) { previousReq = 52; }
				break;
			case stat.fireResist:
			case stat.coldResist:
			case stat.lightningResist:
			case stat.poisonResist:
				if (value <= 10) { previousReq = -1; }
				else if (value >= 11 and value <= 20) { previousReq = 8; }
				else if (value >= 21 and value <= 30) { previousReq = 16; }
				else if (value >= 31) { previousReq = 24; }
				break;
			case stat.enhancedDamage:
				if (value <= 20) { previousReq = -1; }
				else if (value >= 21 and value <= 30) { previousReq = 4; }
				else if (value >= 31 and value <= 40) { previousReq = 8; }
				else if (value >= 41 and value <= 50) { previousReq = 14; }
				else if (value >= 51 and value <= 65) { previousReq = 21; }
				else if (value >= 66 and value <= 80) { previousReq = 27; }
				else if (value >= 81 and value <= 100){ previousReq = 35; }
				else if (value >= 101 and value <= 200){ previousReq = 43; }
				else if (value >= 201) { previousReq = 59; }
				break;
			case stat.goldFind:
				if (value <= 20) { previousReq = -1; }
				else if (value >= 21 and value <= 40) { previousReq = 9; }
				else if (value >= 41) { previousReq = 19; }
				break;
			case stat.maxMana:
				if (value <= 5) { previousReq = 1; }
				else if (value >= 6 and value <= 10) { previousReq = 5; }
				else if (value >= 11 and value <= 20) { previousReq = 12; }
				else if (value >= 21 and value <= 30) { previousReq = 19; }
				else if (value >= 31 and value <= 40) { previousReq = 24; }
				else if (value >= 41 and value <= 60) { previousReq = 29; }
				else if (value >= 61 and value <= 90) { previousReq = 37; }
				else if (value >= 91){ previousReq = 47; }
				break;
			case stat.strength:
			case stat.dexterity:
			case stat.vitality:
			case stat.intelligence:
					 if (value <= 3) { previousReq = -1; }
				else if (value >= 4 and value <= 6) { previousReq = 8; }
				else if (value >= 7 and value <= 9) { previousReq = 24; }
				else if (value >= 10 and value <= 15) { previousReq = 39; }
				else if (value >= 15 and value <= 20) { previousReq = 52; }
				else if (value >= 21) { previousReq = 71; }
				break;
			case stat.ignoreDefence:
				previousReq = 24;
				break;
			case stat.knockback:
				previousReq = 9;
				break;
			case stat.preventHeal:
				previousReq = 13;
				break;
			case stat.lifeSteal:
					 if (value <= 4) { previousReq = 6; }
				else if (value >= 5 and value <= 7) { previousReq = 21; }
				else if (value >= 8) { previousReq = 61; }
				break;
			case stat.manaSteal:
					 if (value <= 4) { previousReq = 4; }
				else if (value >= 5 and value <= 7) { previousReq = 18; }
				else if (value >= 8) { previousReq = 57; }
				break;
			case stat.movementSpeed:
					 if (value == 5) { previousReq = 3; }
				else if (value == 10) { previousReq = 11; }
				else if (value == 20) { previousReq = 19; }
				else if (value == 30) { previousReq = 35; }
				else if (value == 40) { previousReq = 61; }
				break;
			case stat.attackSpeed:
					 if (value == 10) { previousReq = 7; }
				else if (value == 20) { previousReq = 21; }
				else if (value == 30) { previousReq = 35; }
				else if (value == 40) { previousReq = 49; }
				break;
			case stat.castRate:
					 if (value == 10) { previousReq = 6; }
				else if (value == 20) { previousReq = 41; }
				break;
			case stat.maxDamage:
					 if (value == 1) { previousReq = -1; }
				else if (value == 2) { previousReq = 3; }
				else if (value == 3 or value == 4) { previousReq = 8; }
				else if (value >= 5 and value <= 7) { previousReq = 12; }
				else if (value >= 8 and value <= 10) { previousReq = 15; }
				else if (value >= 11 and value <= 14) { previousReq = 20; }
				else if (value >= 15 and value <= 20) { previousReq = 26; }
				else if (value >= 21 and value <= 40) { previousReq = 36; }
				else if (value >= 41) { previousReq = 48; }
				break;
			case stat.minDamage:
					 if (value <= 2) { previousReq = 3; }
				else if (value >= 3 and value <= 5) { previousReq = 11; }
				else if (value >= 6 and value <= 9) { previousReq = 23; }
				else if (value >= 10 and value <= 14) { previousReq = 43; }
				else if (value >= 15) { previousReq = 71; }
				break;
			case stat.blockChance:
					 if (value == 10) { previousReq = -1; }
				else if (value == 20) { previousReq = 10; }
				break;
			case stat.damageReduction:
					 if (value == 1) { previousReq = 6; }
				else if (value == 2) { previousReq = 18; }
				else if (value == 3) { previousReq = 30; }
				else if (value >= 4 and value <= 7) { previousReq = 36; }
				else if (value >= 8 and value <= 15) { previousReq = 42; }
				else if (value >= 16) { previousReq = 48; }
				break;
			case stat.hitRecovery:
					 if (value == 10) { previousReq = 5; }
				else if (value == 20) { previousReq = 12; }
				else if (value == 30) { previousReq = 20; }
				break;
			case stat.healthRegen:
					 if (value <= 5) { previousReq = 12; }
				else if (value >= 6 and value <= 10) { previousReq = 22; }
				else if (value >= 11) { previousReq = 36; }
				break;
			case stat.manaRegen:
					 if (value <= 5) { previousReq = 12; }
				else if (value >= 6 and value <= 10) { previousReq = 22; }
				else if (value >= 11) { previousReq = 36; }
				break;
			case stat.coldLength:
				previousReq = 7;
				break;
			case stat.poisonLength:
					 if (value == 25) { previousReq = 8; }
				else if (value == 50) { previousReq = 17; }
				else if (value == 75) { previousReq = 27; }	
				break;
			case stat.magicFind:
					 if (value <= 5) { previousReq = 4; }
				else if (value >= 6 and value <= 15) { previousReq = 12; }
				else if (value >= 16 and value <= 25) { previousReq = 16; }
				else if (value >= 26) { previousReq = 26; }
				break;
			case stat.requirements:
					 if (value == 20) { previousReq = 16; }
				else if (value == 40) { previousReq = 28; }
				break;
		}
		show_debug_message("current level req for item is "+string(levelReq)+" - level requirement from most recent iteration was "+string(previousReq)+" (for stat "+string(_stat)+")");
		if (previousReq > levelReq){
			levelReq = previousReq;
		}
	}
}

return(levelReq);
show_debug_message(	"\n### ERROR scr_GetReqLevel ####\n"+
					"Did not retrieve a valid level requirement for:\n"+
					"stat: "+string(_stat)+"\n"+
					"value: "+string(value)+"\n"+
					"returning (-1).\n");