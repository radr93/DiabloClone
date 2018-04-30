/*

Syntax:
scr_GetPrefixText(stat);

stat	The stat to convert to a string
value	The value of the stat to convert to a string

This script returns a prefix as a string that corresponds with the
stat/value that were passed as an argument

e.g. stat.defence with a value of 14 becomes "Sturdy "

*/

var _stat = argument0;
var value = argument1;

switch (_stat){
	case stat.socketed:
		if (value <= 2) { return("Mechanic's "); }
		else if (value == 3) { return("Artisan's "); }
		else if (value == 4) { return("Jeweler's "); }
	case stat.attackRating:
		if (value <= 20) { return("Bronze "); }
		else if (value >= 21 and value <= 40) { return("Iron "); }
		else if (value >= 41 and value <= 60) { return("Steel "); }
		else if (value >= 61 and value <= 80) { return("Silver "); }
		else if (value >= 81 and value <= 100) { return("Gold "); }
		else if (value >= 101 and value <= 120) { return("Platinum "); }
		else if (value >= 121 and value <= 150) { return("Meteoric "); }
		else if (value >= 151 and value <= 300) { return("Strange "); }
		else if (value >= 301) { return("Weird "); }
	case stat.enhancedDefence:
		if (value <= 30) { return("Sturdy "); }
		else if (value >= 31 and value <= 40) { return("Strong "); }
		else if (value >= 41 and value <= 50) { return("Glorious "); }
		else if (value >= 51 and value <= 60) { return("Blessed "); }
		else if (value >= 61 and value <= 80) { return("Saintly "); }
		else if (value >= 81 and value <= 100){ return("Holy "); }
		else if (value >= 101) { return("Godly "); }
	case stat.fireDamage:
		if (value <= 25) { return("Fiery "); }
		else if (value >= 26 and value <= 50) { return("Smoking "); }
		else if (value >= 51 and value <= 80) { return("Smoldering "); }
		else if (value >= 81 and value <= 120) { return("Sizzling "); }
		else if (value >= 121) { return("Condensing "); }
	case stat.coldDamage:
		if (value <= 9) { return("Snowy "); }
		else if (value >= 10 and value <= 15) { return("Shivering "); }
		else if (value >= 16 and value <= 23) { return("Boreal "); }
		else if (value >= 24) { return("Hibernal "); }
	case stat.lightningDamage:
		if (value <= 120) { return("Static "); }
		else if (value >= 121 and value <= 180) { return("Glowing "); }
		else if (value >= 181 and value <= 260) { return("Arcing "); }
		else if (value >= 261 and value <= 360) { return("Buzzing "); }
		else if (value >= 361) { return("Shocking "); }
	case stat.poisonDamage:
		if (value == 6) { return("Septic "); }
		else if (value == 12) { return("Foul "); }
		else if (value == 60) { return("Corrosive "); }
		else if (value == 90) { return("Toxic "); }
		else if (value == 165) { return("Pestilent "); }
	case stat.allResist:
		if (value <= 7) { return("Shimmering "); }
		else if (value >= 8 and value <= 11) { return("Rainbow "); }
		else if (value >= 12 and value <= 15) { return("Scintillating "); }
		else if (value >= 16 and value <= 20) { return("Prismatic "); }
		else if (value >= 21) { return("Chromatic "); }
	case stat.fireResist:
		if (value <= 10) { return("Crimson "); }
		else if (value >= 11 and value <= 20) { return("Russet "); }
		else if (value >= 21 and value <= 30) { return("Garnet "); }
		else if (value >= 31) { return("Ruby "); }
	case stat.coldResist:
		if (value <= 10) { return("Azure "); }
		else if (value >= 11 and value <= 20) { return("Lapis "); }
		else if (value >= 21 and value <= 30) { return("Cobalt "); }
		else if (value >= 31) { return("Sapphire "); }
	case stat.lightningResist:
		if (value <= 10){ return("Tangerine "); }
		else if (value >= 11 and value <= 20) { return("Ocher "); }
		else if (value >= 21 and value <= 30) { return("Coral "); }
		else if (value >= 31) { return("Amber "); }
	case stat.poisonResist:
		if (value <= 10) { return("Beryl "); }
		else if (value >= 11 and value <= 20) { return("Viridian "); }
		else if (value >= 21 and value <= 30) { return("Jade "); }
		else if (value >= 31) { return("Emerald "); }
	case stat.enhancedDamage:
		if (value <= 20) { return("Jagged "); }
		else if (value >= 21 and value <= 30) { return("Deadly "); }
		else if (value >= 31 and value <= 40) { return("Vicious "); }
		else if (value >= 41 and value <= 50) { return("Brutal "); }
		else if (value >= 51 and value <= 65) { return("Massive "); }
		else if (value >= 66 and value <= 80) { return("Savage "); }
		else if (value >= 81 and value <= 100){ return("Merciless "); }
		else if (value >= 101 and value <= 200){ return("Ferocious "); }
		else if (value >= 201) { return("Cruel "); }
	case stat.goldFind:
		if (value <= 20) { return("Wealthy "); }
		else if (value >= 21 and value <= 40) { return("Affluent "); }
		else if (value >= 41) { return("Greedy "); }
	case stat.maxMana:
		if (value <= 5) { return("Lizard's "); }
		else if (value >= 6 and value <= 10) { return("Snake's "); }
		else if (value >= 11 and value <= 20) { return("Serpent's "); }
		else if (value >= 21 and value <= 30) { return("Drake's "); }
		else if (value >= 31 and value <= 40) { return("Dragon's "); }
		else if (value >= 41 and value <= 60) { return("Wyrm's "); }
		else if (value >= 61 and value <= 90) { return("Great Wyrm's "); }
		else if (value >= 91){ return("Bahamut's "); }
}
show_debug_message(	"\n### ERROR scr_GetPrefixText line 115 ####\n"+
					"Did not retrieve a valid prefix string for:\n"+
					"stat: "+string(_stat)+"\n"+
					"value: "+string(value)+"\n\n");
return("Broken ");