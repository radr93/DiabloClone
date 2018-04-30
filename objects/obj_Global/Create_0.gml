/// @description Initialize Variables

/// Local Variables
debugOpen = false; // list opened via console command (/debug list) of the states of variables defined in Draw GUI event
	
/// Global Variables

// Date/Time
date_set_timezone(timezone_local);
global.hour = current_hour;
global.minute = current_minute;
global.ampm = ""

// Default Fonts and alignment
global.buttonFont = font_Algerian;
global.messageFont = font_Calibri;
draw_set_color(c_white);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_font(global.messageFont);

// Help File
global.helpFileSize = 18;

// In-Game
global.clickingSomething = false;	// Used to tell if you're clicking something such as a menu or wall
global.launchUI = false; // Set to true when player enters the game

// Save Files
global.saveSlotsMax = 8;
ini_open("save/global/global.ini");
global.saveSlotsUsed = ini_read_real("Save", "Save Slots Used", 0);
show_debug_message("\n### SAVE INFORMATION ######\nglobal.saveSlotsUsed = "+string(global.saveSlotsUsed));
for (s = 0; s < global.saveSlotsMax; s++){
	global.saveSlot[s] = ini_read_string("Save", "Save Slot"+string(s), "");
	show_debug_message("global.saveSlots["+string(s)+"] = "+global.saveSlot[s]);
}
ini_close();