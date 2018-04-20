/// @description Leveling

var healthGain, manaGain;

if(stats[stat.expCurrent] >= stats[stat.expNextLevel]){
	stats[stat.expNextLevel] = round(stats[stat.expNextLevel]*1.212);
	stats[stat.level] += 1;
	stats[stat.statPoints] += 5;
	if (stats[stat.class] == classes.mage){
		stats[stat.maxHealth] += 2;
		healthGain = 2;
		stats[stat.maxMana] += 4;
		manaGain = 4;
	}
	else if (stats[stat.class] == classes.ranger){
		stats[stat.maxHealth] += 3;
		healthGain = 3;
		stats[stat.maxMana] += 3;
		manaGain = 3;
	}
	else if (stats[stat.class] == classes.warrior){
		stats[stat.maxHealth] += 4;
		healthGain = 4;
		stats[stat.maxMana] += 2;
		manaGain = 2;
	}
	
	// Send level information to console
	var b = obj_MessageBox;
	// Loop through message queue and find empty spot
	for (m = 0; m < b.messageQueueMax; m++){
		if (b.messageQueue[m, msg.text] == ""){
			// When you find empty spot in queue, send level information
			// Send level
			b.messageQueue[m, msg.time] = scr_GetTime();
			b.messageQueue[m, msg.sender] = "SYSTEM";
			b.messageQueue[m, msg.text] = "Congratulations! You are now level "+string(stats[stat.level])+".";
			// Send health gain
			b.messageQueue[m+1, msg.time] = scr_GetTime();
			b.messageQueue[m+1, msg.sender] = "SYSTEM";
			b.messageQueue[m+1, msg.text] = "You have gained "+string(healthGain)+" health.";
			// Send mana gain
			b.messageQueue[m+2, msg.time] = scr_GetTime();
			b.messageQueue[m+2, msg.sender] = "SYSTEM";
			b.messageQueue[m+2, msg.text] = "You have gained "+string(manaGain)+" mana.";
			// Send stat point gain
			b.messageQueue[m+3, msg.time] = scr_GetTime();
			b.messageQueue[m+3, msg.sender] = "SYSTEM";
			b.messageQueue[m+3, msg.text] = "You have gained 5 stat points.";
			break; // stop searching the queue for a blank spot (you just found one)
		}
	}
}