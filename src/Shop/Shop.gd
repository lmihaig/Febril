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
		$Dialogue.text = "That's not enough"		
		pass
	else:
		PlayerInfo.coins -= 15
		$Dialogue.text = "Good choice"
		
func _on_Item2_pressed():
	if PlayerInfo.coins < 15:
		$Dialogue.text = "I'm not giving you a discount"		
		pass
	else:
		PlayerInfo.coins -= 15
		$Dialogue.text = "Hope it serves you well"

func _on_Item3_pressed():
	if PlayerInfo.coins < 15:
		$Dialogue.text = "You can't handle my strongest potions"		
		pass
	else:
		PlayerInfo.coins -= 15
		$Dialogue.text = "You can handle my strongest potions"


func _on_Exit_pressed():
	get_tree().change_scene("res://src/Map/Map.tscn")