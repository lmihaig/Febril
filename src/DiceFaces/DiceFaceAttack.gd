extends "res://src/DiceFaces/DiceFace.gd"

var attack

func _init(attack=1):
	self.attack = attack
	return self

func _ready():
	pass 

func _to_string():
	return "Atk_" + str(attack)

func activate(player, enemy):
	pass
