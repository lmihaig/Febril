extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Item1_pressed():
	if PlayerInfo.coins < 15:
		pass
	else:
		PlayerInfo.coins -= 15
		
func _on_Item2_pressed():
	if PlayerInfo.coins < 15:
			pass
	else:
		PlayerInfo.coins -= 15

func _on_Item3_pressed():
	if PlayerInfo.coins < 15:
			pass
	else:
		PlayerInfo.coins -= 15


func _on_Exit_pressed():
	get_tree().change_scene("res://src/Map/Map.tscn")
