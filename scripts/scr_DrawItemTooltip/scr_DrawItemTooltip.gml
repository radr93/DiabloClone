/*

Syntax:
scr_DrawItemTooltip(item);

item = The item to draw the tooltip for

This script draws a tooltip with item information at mouse_x and mouse_y when hovering
over an item.

*/

// Initialize Variables
var item, tooltip, text_width, text_height, view_x, view_y, view_width, view_height, player, xOffset, yOffset, xCenter, yCenter, xx, yy;

item = argument0;
tooltip = item[property.tooltip];
text_width  = (-5 +- string_width(tooltip));
text_height = (-5 +- string_height(tooltip));
view_x = camera_get_view_x(obj_Camera.camera);
view_y = camera_get_view_y(obj_Camera.camera);
view_width = camera_get_view_width(obj_Camera.camera);
view_height = camera_get_view_height(obj_Camera.camera);
player = obj_PlayerController;

// Get tooltip offsets (based on mouse position in screen)
// xOffset (push tooltip left or right)
if (mouse_x < view_x+(view_width/2)) { xOffset = 48; }
else if (mouse_x >= view_x+(view_width/2)) { xOffset = -48; }
// yOffset (push tooltip up or down)
if (mouse_y < view_y+(view_height/2)) { yOffset = 48; }
else if (mouse_y >= view_y+(view_height/2)) { yOffset = -48; }

// Get Draw Position
xCenter = mouse_x + xOffset;
yCenter = mouse_y + yOffset;

// Make magic blue color
var c_magicBlueRGB, c_magicBlueHSV, c_magicBlue,;
c_magicBlueRGB = make_color_rgb(42, 89, 255);
c_magicBlueHSV = make_color_hsv(227, 84, 100);
c_magicBlue = merge_color(c_magicBlueRGB, c_magicBlueHSV, 0.5)

//Set color, font, alpha and alignment
draw_set_font(global.messageFont);
draw_set_alpha(0.75);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
    
//Draw a rectangle behind the text and draw text on top
draw_roundrect_color((xCenter - (text_width/2)), (yCenter - (text_height/2)),
					 (xCenter + (text_width/2)), (yCenter + (text_height/2)),
					 c_black, c_black, false);  

// Set draw start position
xx = xCenter;
yy = yCenter - ((string_height(tooltip)/2)-8);
// Set Color
if (item[property.rarity] == rarity.magic) {
	draw_set_color(c_magicBlue);
}
else{
	draw_set_color(item[property.rarity]);
	if (item[property.rarity] == rarity.normal and (item[property.socketed] == true or item[property.ethereal] == true)){
		draw_set_color(c_gray);
	}
}

// Title
if (item[property.title] != -1){
	draw_text(xx, yy, item[property.title]); yy+=16;
	draw_text(xx, yy, item[property.name]); yy+=16;
}
// Prefix/Suffix
else if (item[property.prefix] != -1 or item[property.suffix] != -1){
	if (item[property.prefix] != -1 and item[property.suffix] == -1){
		draw_text(xx, yy, item[property.prefix]+item[property.name]); yy+=16;
	}
	else if(item[property.prefix] == -1 and item[property.suffix] != -1){
		draw_text(xx, yy, item[property.name]+item[property.suffix]); yy+=16;
	}
	else{
		draw_text(xx, yy, item[property.prefix]+item[property.name]+item[property.suffix]); yy+= 16
	}
}
// Plain Name
else{
	draw_text(xx, yy, item[property.name]); yy+=16;
}
// Sub-Title
if (item[property.subTitle] != -1){
	draw_text(xx, yy, item[property.subTitle]); yy+=16;
}

draw_set_color(c_white);
// Defence (Armor Only)
if (item[property.type] == type.armor){
	var Defence = "Defence: ";
	var DefenceValue = string(item[property.defence]);
	draw_text(xx-(string_width(DefenceValue)/2), yy, Defence);
	draw_set_color(c_magicBlue);
	draw_set_halign(fa_left);
	draw_text(xx+((string_width(Defence)-string_width(DefenceValue))/2), yy, DefenceValue); yy+=16;
	draw_set_halign(fa_center);
	draw_set_color(c_white);
}
// Damage (Weapon Only)
if (item[property.type] == type.weapon){
	var Damage = "Damage: ";
	var DamageValues = string(item[property.minDamage])+" to "+string(item[property.maxDamage]);
	draw_text(xx-(string_width(DamageValues)/2), yy, Damage);
	draw_set_color(c_magicBlue);
	draw_set_halign(fa_left);
	draw_text(xx+((string_width(Damage)-string_width(DamageValues))/2), yy, DamageValues); yy+=16;
	draw_set_halign(fa_center);
	draw_set_color(c_white);
}
// Durability (Armor and Weapons)
if (item[property.type] == type.armor or item[property.type] == type.weapon){
	draw_text(xx, yy, "Durability: "+string(item[property.durability])+" of "+string(item[property.maxDurability])); yy+=16;
}
// Requirements
if (item[property.reqStrength] != -1){
	if (player.stats[stat.strength] < item[property.reqStrength]){
		draw_set_color(c_red);
		draw_text(xx, yy, "Required Strength: "+string(item[property.reqStrength])); yy+=16;
		draw_set_color(c_white);
	}
	else{ draw_text(xx, yy, "Required Strength: "+string(item[property.reqStrength])); yy+=16; }
}
if (item[property.reqDexterity] != -1){
	if (player.stats[stat.dexterity] < item[property.reqDexterity]){
		draw_set_color(c_red);
		draw_text(xx, yy, "Required Dexterity: "+string(item[property.reqDexterity])); yy+=16;
		draw_set_color(c_white);
	}
	else{ draw_text(xx, yy, "Required Dexterity: "+string(item[property.reqDexterity])); yy+=16; }
}
if (item[property.reqIntelligence] != -1){
	if (player.stats[stat.intelligence] < item[property.reqIntelligence]){
		draw_set_color(c_red);
		draw_text(xx, yy, "Required Intelligence: "+string(item[property.reqIntelligence])); yy+=16;
		draw_set_color(c_white);
	}
	else{ draw_text(xx, yy, "Required Intelligence: "+string(item[property.reqIntelligence])); yy+=16; }
}
if (item[property.reqLevel] != -1){
	if (player.stats[stat.level] < item[property.reqLevel]){
		draw_set_color(c_red);
		draw_text(xx, yy, "Required Level: "+string(item[property.reqLevel])); yy+=16;
		draw_set_color(c_white);
	}
	else{ draw_text(xx, yy, "Required Level: "+string(item[property.reqLevel])); yy+=16; }
}

draw_set_color(c_magicBlue);
// Magic Properties
if (item[property.magic1stat] != -1){
	if (item[property.magic1stat] != stat.socketed){
		draw_text(xx, yy, item[property.magic1string]); yy+=16;
	}
	if (item[property.magic2stat] != -1){
		if (item[property.magic2stat] != stat.socketed){
			draw_text(xx, yy, item[property.magic2string]); yy+=16;
		}
		if (item[property.magic3stat] != -1){
			if (item[property.magic3stat] != stat.socketed){
				draw_text(xx, yy, item[property.magic3string]); yy+=16;
			}
			if (item[property.magic4stat] != -1){
				if (item[property.magic4stat] != stat.socketed){
					draw_text(xx, yy, item[property.magic4string]); yy+=16;
				}
				if (item[property.magic5stat] != -1){
					if (item[property.magic5stat] != stat.socketed){
						draw_text(xx, yy, item[property.magic5string]); yy+=16;
					}
					if (item[property.magic6stat] != -1){
						if (item[property.magic6stat] != stat.socketed){
							draw_text(xx, yy, item[property.magic6string]); yy+=16;
						}
					}
				}
			}
		}
	}
}
// Socketed
if (item[property.socketed] == true){
	draw_text(xx, yy, "Socketed ("+string(item[property.sockets])+")"); yy+=16;
}
// Ethereal
if (item[property.ethereal] == true){
	draw_text(xx, yy, "Ethereal (Cannot be repaired)"); yy+=16;
}

draw_set_color(c_fuchsia);
// Item level
draw_text(xx, yy, "iLvl: "+string(item[property.itemLevel])); yy+=16;
    
// Reset alpha and alignment
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);