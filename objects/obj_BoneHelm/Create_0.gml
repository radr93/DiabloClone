/// @description Initialize Variables

// Inherit from head parent
event_inherited();

// Leather Cap specific variables
item[property.name] = "Bone Helm";
item[property.sprite] = spr_BoneHelm;
item[property.object] = obj_BoneHelm;
item[property.defence] = irandom_range(17, 27);
item[property.reqStrength] = 20;