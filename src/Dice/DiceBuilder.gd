extends Node



static func build_dice_l(dice_faces_l):
	var dice=load("res://src/Dice/Dice.tscn").instance()
	dice.get_child(0).set_faces(dice_faces_l)
	return dice
