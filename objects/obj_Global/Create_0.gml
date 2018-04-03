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
global.messageFont = font_Calibri;
draw_set_color(c_white);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_font(global.messageFont);

// Help
global.helpFileSize = 15;

// In-Game
global.clickingSomething = false;	// Used to tell if you're clicking something such as a menu or wall