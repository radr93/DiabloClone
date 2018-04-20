/// @description Create the character
/// ALL OF THIS CODE IS IN THE KEY PRESS ENTER EVENT AS WELL
// If the button was clicked
if (clicking == true){
	// If a class has been selected
	if (class != -1){
		var nameTaken = false;
		for (s = 0; s < global.saveSlotsMax; s ++){
			if (name == global.saveSlot[s]){
				nameTaken = true;
			}
		}
		// If a name has been selected
		if (name != "" and nameTaken == false){
			// Create a new player controller and assign class specific variables
			i = instance_create_layer(x, y, "Controllers", obj_PlayerController);
			i.stats[stat.class] = class;
			i.stats[stat.name] = name;
			i.stats[stat.level] = 1;
			i.stats[stat.expNextLevel] = 82;
			
			if (i.stats[stat.class] == classes.mage){
				i.stats[stat.classString] = "Mage";
				i.stats[stat.strength] = 10;
				i.stats[stat.dexterity] = 10;
				i.stats[stat.vitality] = 15;
				i.stats[stat.intelligence] = 20;
				i.stats[stat.maxHealth] = i.stats[stat.vitality]*2;
				i.stats[stat.maxMana] = i.stats[stat.intelligence]*4;
			}
			else if (i.stats[stat.class] == classes.ranger){
				i.stats[stat.classString] = "Ranger";
				i.stats[stat.strength] = 10;
				i.stats[stat.dexterity] = 20;
				i.stats[stat.vitality] = 15;
				i.stats[stat.intelligence] = 10;
				i.stats[stat.maxHealth] = i.stats[stat.vitality]*3;
				i.stats[stat.maxMana] = i.stats[stat.intelligence]*3;
			}
			else if (i.stats[stat.class] == classes.warrior){
				i.stats[stat.classString] = "Warrior";
				i.stats[stat.strength] = 20;
				i.stats[stat.dexterity] = 10;
				i.stats[stat.vitality] = 15;
				i.stats[stat.intelligence] = 10;
				i.stats[stat.maxHealth] = i.stats[stat.vitality]*4;
				i.stats[stat.maxMana] = i.stats[stat.intelligence]*2;
			}
			i.stats[stat.currentHealth] = i.stats[stat.maxHealth];
			i.stats[stat.currentMana] = i.stats[stat.maxMana];
			
			// Store character name in global save slot
			global.saveSlot[global.saveSlotsUsed] = name;
			global.saveSlotsUsed++;
			room_goto(room0);
		}
		else{
			show_message("THAT NAME IS TAKEN!");
		}
	}
}