/*

Syntax:
scr_GetPropertiesAsArray(item);

item	The array of the item properties to convert to new array

This script returns an array that contains each stat the item has in the
item[property.x] array, for ease of shorter iterations.

*/

var item, propArray;

item = argument0;

propArray[0,0] = item[property.magic1stat];
propArray[0,1] = item[property.magic1value];
propArray[1,0] = item[property.magic2stat];
propArray[1,1] = item[property.magic2value];
propArray[2,0] = item[property.magic3stat];
propArray[2,1] = item[property.magic3value];
propArray[3,0] = item[property.magic4stat];
propArray[3,1] = item[property.magic4value];
propArray[4,0] = item[property.magic5stat];
propArray[4,1] = item[property.magic5value];
propArray[5,0] = item[property.magic6stat];
propArray[5,1] = item[property.magic6value];

return(propArray);