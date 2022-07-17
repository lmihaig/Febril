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
	enemy.damage(self.attack)

func get_texture():
	texture = load("res://assets/dices/sword_"+str(attack)+".png")
	return texture
