extends "res://src/DiceFaces/DiceFace.gd"

var defence

func _init(defence=1):
	self.defence = defence
	return self

func _ready():
	pass 

func _to_string():
	return "Def_" + str(defence)

func activate(player, enemy):
	player.add_shield(self.defence)

func get_texture():
	texture = load("res://assets/dices/shield_"+str(defence)+".png")
	return texture
