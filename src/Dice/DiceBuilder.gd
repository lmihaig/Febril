extends Node


var dice_scene=preload("res://src/Dice/Dice.tscn")

func build_dice_l(dice_faces_l):
	var dice=dice_scene.instance()
	dice.get_child(0).set_faces(dice_faces_l)
	return dice
