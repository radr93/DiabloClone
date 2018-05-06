/// @description Initialize Variables

tcMaster = load_csv("tcdb/tcMaster.csv");
for (var i = 0; i < 4; i++){
	tcArmor[i] = load_csv("tcdb/armor/armor"+string(i)+".csv");
}

/*
for (var i = 0; i < 31; i++){
	tcArmor[i] = load_csv("tcdb/armor/armor"+string(i)+".csv");
}
for (i = 0; i < 31; i++){
	tcWeapons[i] = load_csv("tcdb/weapons/weapon"+string(i)+".csv");
}*/

// Treasure Class Master column indexes
enum tcmColumn{
	treasureClass,
	level,
	picks,
	noDrop,
	choice1,prob1,	choice2,prob2,	choice3,prob3,	choice4,prob4,	choice5,prob5,
	choice6,prob6,	choice7,prob7,	choice8,prob8,	choice9,prob9,	choice10,prob10,
	sumChoices,
	totalProb,
	dropChance,
	range,
	MAX
}

enum tcmRow{
	COLUMN_INDICATOR,
	gold,
	jewelry,
	hpotion1,hpotion2,
	mpotion1,mpotion2,
	runes0,runes1,runes2,runes3,runes4,runes5,
	tc0,tc1,tc2,tc3,tc4,tc5,tc6,tc7,tc8,tc9,
	tc10,tc11,tc12,tc13,tc14,tc15,tc16,tc17,tc18,tc19,
	tc20,tc21,tc22,tc23,tc24,tc25,tc26,tc27,tc28,tc29,tc30,
	MAX
}