extends "res://src/DiceFaces/DiceFace.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var attack

func _init(attack=1):
	self.attack=attack

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func activate(player, enemy):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass