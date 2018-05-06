/// @description Create Item

// Set size and direction on the ground
angle = (random_range(0, 360))

// Initialize Item Property Array
for (p = 0; p < property.MAX; p++){
	item[p] = -1;
}
// Change booleans from -1 to boolean value
item[property.socketed] = false;
item[property.ethereal] = false;

// Set alarm 0 to generate properties
rarityMultiplier = 1; // Default 1x. 2x doubles chances of magical+ quality (before mf is factored)
alarm[0] = 1;	
// Item generates properties in alarm[0] code to allow 1 frame to retrieve an 
// item level and rarityMuliplier (if applicable) from the drop source