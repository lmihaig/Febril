extends Node2D


func _on_Heal1_pressed():
	PlayerInfo.HP = clamp(PlayerInfo.HP + 15, 0, PlayerInfo.maxHP)
	get_tree().change_scene("res://src/Map/Map.tscn")

func _on_Heal2_pressed():
	if PlayerInfo.coins < 15:
		pass
	else:
		PlayerInfo.HP = clamp(PlayerInfo.HP + 45, 0, PlayerInfo.maxHP)
		PlayerInfo.coins -= 15
		get_tree().change_scene("res://src/Map/Map.tscn")
		
