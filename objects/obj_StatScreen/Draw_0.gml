/// @description Draw Stats Menu

x = camera_get_view_x(obj_Camera.camera);
y = camera_get_view_y(obj_Camera.camera);

// Draw Backdrop
draw_sprite(spr_StatScreen, 0, x, y);

// Set color, font, alignment
draw_set_color(c_white);
draw_set_font(font_Calibri);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw Information
var p = obj_PlayerController
// Name
draw_text(x+120, y+48, p.stats[stat.name]);

// Class
draw_text(x+288, y+48, p.stats[stat.classString]);

// Level
draw_text(x+52, y+96, "Level\n"+string(p.stats[stat.level]));

// Current Experience
draw_text(x+144,y+96,"Experience\n"+string(p.stats[stat.expCurrent]));

// Max Experience
draw_text(x+288,y+96,"Next Level\n"+string(p.stats[stat.expNextLevel]));

// Strength
draw_text(x+75,y+144, "Strength");
draw_text(x+140,y+144, string(p.stats[stat.strength]));

// Dexterity
draw_text(x+75,y+208, "Dexterity");
draw_text(x+140,y+208, string(p.stats[stat.dexterity]));

// Vitality
draw_text(x+75,y+272, "Vitality");
draw_text(x+140,y+272, string(p.stats[stat.vitality]));

// Intelligence
draw_text(x+75,y+336, "Intelligence");
draw_text(x+140,y+336, string(p.stats[stat.intelligence]));

// Stat Points
draw_text(x+75,y+384, "Stat Points");
draw_text(x+140,y+384, string(p.stats[stat.statPoints]));

// Attack Damage
draw_text(x+224,y+144, "ATTACK\nDamage");
draw_text(x+294,y+144, string(p.stats[stat.minDamageAdded]));
draw_text(x+332,y+144, string(p.stats[stat.maxDamageAdded]));

// Attack Two Damage
draw_text(x+224,y+176, "ATTACK TWO\nDamage");
draw_text(x+294,y+176, string(p.stats[stat.minDamageAdded]));
draw_text(x+332,y+176, string(p.stats[stat.maxDamageAdded]));

// Attack Rating
draw_text(x+240,y+224, "ATTACK\nRating");
draw_text(x+332,y+224, string(p.stats[stat.attackRating]));

// Attack Rating Two
draw_text(x+240,y+256, "ATTACK TWO\nRating");
draw_text(x+332,y+256, string(p.stats[stat.attackRating]));

// Defence
draw_text(x+244,y+304, "Defence");
draw_text(x+332,y+304, string(p.stats[stat.defence]));

// Health
draw_text(x+224,y+352, "Health");
draw_text(x+294,y+352, string(p.stats[stat.currentHealth]));
draw_text(x+332,y+352, string(p.stats[stat.maxHealth]));

// Mana
draw_text(x+224,y+384, "Mana");
draw_text(x+294,y+384, string(p.stats[stat.currentMana]));
draw_text(x+332,y+384, string(p.stats[stat.maxMana]));

// Fire Resistance
draw_text(x+268,y+432, "Fire\nResistance");
draw_text(x+332,y+432, string(p.stats[stat.fireResist]));

// Cold Resistance
draw_text(x+268,y+464, "Cold\nResistance");
draw_text(x+332,y+464, string(p.stats[stat.coldResist]));

// Lightning Resistance
draw_text(x+268,y+496,"Lightning\nResistance");
draw_text(x+332,y+496, string(p.stats[stat.lightningResist]));

// Poison Resistance
draw_text(x+268,y+528,"Poison\nResistance");
draw_text(x+332,y+528, string(p.stats[stat.poisonResist]));


// Reset Align
draw_set_halign(fa_left);
draw_set_valign(fa_top);