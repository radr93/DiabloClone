/*

Syntax:
scr_GetRareName(type, subType);

type	The type of item to get name for
subType	The subType of item to get name for


This script returns a rare name in the form of a string depending on which
kind of item it is.

*/

var _type, _subType, firstWord, secondWord, title;
_type = argument0;
_subType = argument1;

// First Word
switch _type{
	case type.armor:
		switch _subType{
			case armor.head:
				
			case armor.chest:
				
			case armor.shield:
				
			case armor.hands:
				
			case armor.belt:
				
			case armor.feet:
				firstWord = choose(
				"Grim ", "Terror ", "Horror ", "Tribulation ", "Death ", "Hubris ", "Challenge ", "Nightmare ", "Dream ",
				"Destruction ", "Ghostly ", "Ghastly "
				)
				break;
		}
	case type.weapon:
		switch _subType{
			case weapon.axe:
				
			case weapon.sword:
				
			case weapon.mace:
				
			case weapon.bow:
				
			case weapon.polearm:
				firstWord = choose(
				"Flesh ", "Brain ", "Spine ", "Specter ", "Evil ", "Destruction ", "Bone ", "Visceral ", "Gore " 
				)
				break;
		}
	case type.jewelry:
		switch _subType{
			case jewelry.neck:
				
			case jewelry.ring:
				firstWord = choose(
				"Dream ", "Nightmare ", "Hell ", "Evil ", "Angelic ", "Existence ", "Powerful ", "Destruction ", "Love ", "Hate "
				)
				break;
		}	
}

// Second Word
switch _type{
	case type.armor:
		switch _subType{
			case armor.head:
				secondWord = choose(
				"Bonnet", "Chapeau", "Lid", "Sombrero", "Toque", "Cap", "Helm", "Halo"
				)
				break;
			case armor.chest:
				secondWord = choose(
				"Coat", "Tunic", "Sark", "Threads", "Wrap", "Wraps", "Skin", "Husk", "Fleece", "Scales", "Integument"
				)
				break;
			case armor.shield:
				secondWord = choose(
				"Ward", "Protector", "Buffer", "Bulwark", "Cover", "Aegis", "Escutcheon", "Crest", "Guard"
				)
				break;
			case armor.hands:
				secondWord = choose(
				"Mitts", "Gauntlets", "Grips", "Grasp", "Grip", "Guard", "Clinchers"
				)
				break;
			case armor.belt:
				secondWord = choose(
				"Cinch", "Strap", "Cincture", "Girdle", "Sash", "Buckle", "String", "Waistband",
				)
				break;
			case armor.feet:
				secondWord = choose(
				"Slippers", "Shoes", "Treads", "Waders", "Cleats", "Sneakers", "Moccasins", "Clogs", "Loafers"
				)
				break;
		}
		break;
	case type.weapon:
		switch _subType{
			case weapon.axe:
				secondWord = choose(
				"Hewer", "Cleaver", "Fell", "Hacker", "Chopper", "Lopper"
				)
				break;
			case weapon.sword:
				secondWord = choose(
				"Slicer", "Slasher", "Skewer", "Blade", "Edge", "Cutter", "Plunger", "Stabber"
				)
				break;
			case weapon.mace:
				secondWord = choose(
				"Crusher", "Smasher", "Buster", "Ruiner", "Shatterer", "Slammer", "Wrecker", "Destroyer", "Walloper"
				)
				break;
			case weapon.bow:
				secondWord = choose(
				"Wood", "Song", "Needler", "Flight", "Horn", "Blinder"
				)
				break;
			case weapon.polearm:
				secondWord = choose(
				"Branch", "Twig", "Hewer", "Chopper", "Skewer", "Decapitator", "Beheader"
				)
				break;
		}
		break;
	case type.jewelry:
		switch _subType{
			case jewelry.neck:
				secondWord = choose(
				"Gorget", "String", "Necklace", "Amulet", "Pendant", "Charm"
				)
				break;
			case jewelry.ring:
				secondWord = choose(
				"Loop", "Band", "Ring", "Aureole", "Wreath", "Hoop", "Cordon", "Whorl"
				)
				break;
		}
		break;
}

// Concatenation
title = firstWord+secondWord;
return(title);








