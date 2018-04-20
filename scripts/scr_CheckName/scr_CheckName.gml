/*

Syntax:
scr_CheckName(name);

name	The name to parse

This script parses a proposed name (when naming a new character) for acceptability.
It sets max name length, doesn't allow symbols or numbers, and must be different than
any of the already created characters' names.

*/

var name, nameLength;
name = (argument0);
name = string_letters(argument0);
nameLength  = string_length(name);

if (nameLength > 10){
	name = string_copy(name, 1, 10);
}

return(name);