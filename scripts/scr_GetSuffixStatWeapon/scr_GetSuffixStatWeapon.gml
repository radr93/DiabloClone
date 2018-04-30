/*

Syntax:
scr_GetSuffixStatWeapon(itemLevel);

itemLevel	The item's level

This script gets an appropriate suffix for weapon slot items.

*/

var iLvl, chance, choice;
iLvl = argument0;

// ITEM LEVEL 1+ ROLLS
chance = choose(1,2,3,4,5,6);
switch chance{
	case 1:	choice = stat.strength;		break;
	case 2:	choice = stat.dexterity;	break;
	case 3:	choice = stat.vitality;		break;
	case 4:	choice = stat.intelligence;	break;
	case 5: choice = stat.minDamage;	break;
	case 6: choice = stat.maxDamage;	break;
}
// ITEM LEVEL 5+ ROLLS
if (iLvl >= 5){
	chance = choose(1,2,3,4,5,6,7);
	switch chance{
		case 1:	choice = stat.strength;		break;
		case 2:	choice = stat.dexterity;	break;
		case 3:	choice = stat.vitality;		break;
		case 4:	choice = stat.intelligence;	break;
		case 5: choice = stat.minDamage;	break;
		case 6: choice = stat.maxDamage;	break;
		case 7: choice = stat.attackSpeed;	break;
	}
}
// ITEM LEVEL 6+ ROLLS
if (iLvl >= 5){
	chance = choose(1,2,3,4,5,6,7,8,9);
	switch chance{
		case 1:	choice = stat.strength;		break;
		case 2:	choice = stat.dexterity;	break;
		case 3:	choice = stat.vitality;		break;
		case 4:	choice = stat.intelligence;	break;
		case 5: choice = stat.minDamage;	break;
		case 6: choice = stat.maxDamage;	break;
		case 7: choice = stat.attackSpeed;	break;
		case 8: choice = stat.lifeSteal;	break;
		case 9: choice = stat.manaSteal;	break;
	}
}
// ITEM LEVEL 8+ ROLLS
if (iLvl >= 8){
	chance = choose(1,2,3,4,5,6,7,8,9,10);
	switch chance{
		case 1:	choice = stat.strength;		break;
		case 2:	choice = stat.dexterity;	break;
		case 3:	choice = stat.vitality;		break;
		case 4:	choice = stat.intelligence;	break;
		case 5: choice = stat.minDamage;	break;
		case 6: choice = stat.maxDamage;	break;
		case 7: choice = stat.attackSpeed;	break;
		case 8: choice = stat.lifeSteal;	break;
		case 9: choice = stat.manaSteal;	break;
		case 10: choice = stat.knockback;	break;
	}
}
// ITEM LEVEL 9+ ROLLS
if (iLvl >= 9){
	chance = choose(1,2,3,4,5,6,7,8,9,10,11);
	switch chance{
		case 1:	choice = stat.strength;		break;
		case 2:	choice = stat.dexterity;	break;
		case 3:	choice = stat.vitality;		break;
		case 4:	choice = stat.intelligence;	break;
		case 5: choice = stat.minDamage;	break;
		case 6: choice = stat.maxDamage;	break;
		case 7: choice = stat.attackSpeed;	break;
		case 8: choice = stat.lifeSteal;	break;
		case 9: choice = stat.manaSteal;	break;
		case 10: choice = stat.knockback;	break;
		case 11: choice = stat.preventHeal; break;
	}
}
// ITEM LEVEL 15+ ROLLS
if (iLvl >= 15){
	chance = choose(1,2,3,4,5,6,7,8,9,10,11,12);
	switch chance{
		case 1:	choice = stat.strength;		break;
		case 2:	choice = stat.dexterity;	break;
		case 3:	choice = stat.vitality;		break;
		case 4:	choice = stat.intelligence;	break;
		case 5: choice = stat.minDamage;	break;
		case 6: choice = stat.maxDamage;	break;
		case 7: choice = stat.attackSpeed;	break;
		case 8: choice = stat.lifeSteal;	break;
		case 9: choice = stat.manaSteal;	break;
		case 10: choice = stat.knockback;	break;
		case 11: choice = stat.preventHeal; break;
		case 12: choice = stat.requirements;break;
	}
}
// ITEM LEVEL 25+ ROLLS
if (iLvl >= 25){
	chance = choose(1,2,3,4,5,6,7,8,9,10,11,12,13);
	switch chance{
		case 1:	choice = stat.strength;		break;
		case 2:	choice = stat.dexterity;	break;
		case 3:	choice = stat.vitality;		break;
		case 4:	choice = stat.intelligence;	break;
		case 5: choice = stat.minDamage;	break;
		case 6: choice = stat.maxDamage;	break;
		case 7: choice = stat.attackSpeed;	break;
		case 8: choice = stat.lifeSteal;	break;
		case 9: choice = stat.manaSteal;	break;
		case 10: choice = stat.knockback;	break;
		case 11: choice = stat.preventHeal; break;
		case 12: choice = stat.requirements;break;
		case 13: choice = stat.ignoreDefence;break;
	}
}
return(choice);
