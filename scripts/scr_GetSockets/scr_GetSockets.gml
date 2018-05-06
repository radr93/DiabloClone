/*

Syntax:
scr_GetSockets(itemLevel, maxSockets);

itemLevel	The item's level 
maxSockets	The most sockets the item is allowed to have

This script returns a random number of sockets between 1 and the max
amount allowed for the item calling.

*/

var maxSockets = argument0;
var sockets = irandom_range(1, maxSockets);
return(sockets);