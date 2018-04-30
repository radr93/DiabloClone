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
	// Elemental Damage
	case stat.fireDamage:
		if(iLvl <= 34) { choice = irandom_range(31,60); }
		else if(iLvl >= 35 and iLvl <= 46) { choice = irandom_range(61,90); }
		else if(iLvl >= 47 and iLvl <= 60) { choice = irandom_range(91,130); }
		else if(iLvl >= 61 and iLvl <= 76) { choice = irandom_range(131,180); }
		else if(iLvl >= 77) { choice = irandom_range(181,240); }
		return(choice);
	case stat.coldDamage:
		if(iLvl <= 34) { choice = irandom_range(19,30); }
		else if(iLvl >= 35 and iLvl <= 49) { choice = irandom_range(31,45); }
		else if(iLvl >= 50 and iLvl <= 74) { choice = irandom_range(46,90); }
		else if(iLvl >= 75) { choice = irandom_range(91,140); }
		return(choice);
	case stat.lightningDamage:
		if(iLvl <= 33) { choice = irandom_range(49,120); }
		else if(iLvl >= 34 and iLvl <= 45) { choice = irandom_range(121,180); }
		else if(iLvl >= 46 and iLvl <= 59) { choice = irandom_range(181,260); }
		else if(iLvl >= 60 and iLvl <= 75) { choice = irandom_range(261,360); }
		else if(iLvl >= 76) { choice = irandom_range(361,480); }
		return(choice);
}
return(-1);
show_debug_message("scr_GetStatValue2 malfunction, could not retrieve second value for stat: "+string(_stat)+" at item level "+string(iLvl));