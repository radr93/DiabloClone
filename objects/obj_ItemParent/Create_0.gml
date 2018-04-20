/// @description Create Item

// Set size and direction on the ground
image_angle = (random_range(0, 360))
image_xscale = .50;
image_yscale = .50

// Initialize Item Property Array
for (p = 0; p < property.MAX; p++){
	item[p] = -1;
}
item[property.socketed] = false;
item[property.ethereal] = false;

// Set alarm 1 to generate properties
rarityMultiplier = 1; // Default 1x. 2x doubles chances of magical+ quality (before mf is factored)
alarm[0] = 1; // Allows for 1 step to retrieve monster's base chance + item level