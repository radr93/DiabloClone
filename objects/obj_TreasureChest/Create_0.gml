/// @description Initialize Variables

image_speed = 0;

level = irandom_range(1, 30);				// Level of the drop source
var _tc = string(round(level/3));
if (level > 27){
	_tc = 9;
}
treasureClass = "tc"+string(_tc);	// Highest TC the source can drop from
rarityMultiplier = 1;	// Bonus chance of getting magical items