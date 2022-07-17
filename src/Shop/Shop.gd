extends Node2D

func _ready():
	$Coin/Label.text = "x" + str(PlayerInfo.coins)


func _on_Item1_pressed():
	if PlayerInfo.coins < 15:
		$Dialogue.text = "That's not enough"		
		pass
	else:
		PlayerInfo.coins -= 15
		$Dialogue.text = "Good choice"
		$Coin/Label.text = "x" + str(PlayerInfo.coins)
		
		
func _on_Item2_pressed():
	if PlayerInfo.coins < 15:
		$Dialogue.text = "I'm not giving you a discount"		
		pass
	else:
		PlayerInfo.coins -= 15
		$Dialogue.text = "Hope it serves you well"
		$Coin/Label.text = "x" + str(PlayerInfo.coins)
		

func _on_Item3_pressed():
	if PlayerInfo.coins < 15:
		$Dialogue.text = "You can't handle my strongest potions"		
		pass
	else:
		PlayerInfo.coins -= 15
		$Dialogue.text = "You can handle my strongest potions"
		$Coin/Label.text = "x" + str(PlayerInfo.coins)
		


func _on_Exit_pressed():
	get_tree().change_scene("res://src/Map/Map.tscn")
