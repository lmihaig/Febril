extends Node2D

var items = []
var bought = [false, false, false]

func _ready():
	$Coin/Label.text = "x" + str(PlayerInfo.coins)
	randomize()
	var possible_items = [1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 5, 5, 6]
	for _i in range(3):
		var rand_nr = randi() % 21
		var rand_ty = randi() % 2
		if rand_ty == 0:
			items.append(["atk", possible_items[rand_nr], load("res://src/DiceFaces/DiceFaceAttack.gd").new()._init(possible_items[rand_nr])])
		else:
			items.append(["def", possible_items[rand_nr], load("res://src/DiceFaces/DiceFaceDefence.gd").new()._init(possible_items[rand_nr])])
	
	$Item1.text = str(6 * items[0][1]) + "g"
	$Item2.text = str(6 * items[1][1]) + "g"
	$Item3.text = str(6 * items[2][1]) + "g"
	
	if items[0][0] == "atk":
		$Item1.icon = load("res://assets/dices/sword_" + str(items[0][1]) + ".png")
	else:
		$Item1.icon = load("res://assets/dices/shield_" + str(items[0][1]) + ".png")
	
	if items[1][0] == "atk":
		$Item2.icon = load("res://assets/dices/sword_" + str(items[1][1]) + ".png")
	else:
		$Item2.icon = load("res://assets/dices/shield_" + str(items[1][1]) + ".png")
	
	if items[2][0] == "atk":
		$Item3.icon = load("res://assets/dices/sword_" + str(items[2][1]) + ".png")
	else:
		$Item3.icon = load("res://assets/dices/shield_" + str(items[2][1]) + ".png")

func _on_Item1_pressed():
	var price = 6 * self.items[0][1]
	if PlayerInfo.coins < price:
		$Dialogue.text = "That's not enough"		
		pass
	elif self.bought[0] == true:
		$Dialogue.text = "You already bought this item"
		pass
	else:
		PlayerInfo.coins -= price
		PlayerInfo.unused_faces.append(self.items[0][2])
		self.bought[0] = true
		$Dialogue.text = "Good choice"
		$Coin/Label.text = "x" + str(PlayerInfo.coins)
		$Item1.hide()
		
	print(PlayerInfo.unused_faces)
		
func _on_Item2_pressed():
	var price = 6 * self.items[1][1]
	if PlayerInfo.coins < price:
		$Dialogue.text = "I'm not giving you a discount"		
		pass
	elif self.bought[1] == true:
		$Dialogue.text = "You already bought this item"
		pass
	else:
		PlayerInfo.coins -= price
		PlayerInfo.unused_faces.append(self.items[1][2])
		self.bought[1] = true
		$Dialogue.text = "You can handle my strongest dice face"
		$Coin/Label.text = "x" + str(PlayerInfo.coins)
		$Item2.hide()
	print(PlayerInfo.unused_faces)
	
func _on_Item3_pressed():
	var price = 6 * self.items[1][1]
	if PlayerInfo.coins < price:
		$Dialogue.text = "You can't handle my strongest dice faces"		
		pass
	elif self.bought[2] == true:
		$Dialogue.text = "You already bought this item"
		pass
	else:
		PlayerInfo.coins -= price
		PlayerInfo.unused_faces.append(self.items[1][2])
		self.bought[2] = true
		$Dialogue.text = "Hope it serves you well"
		$Coin/Label.text = "x" + str(PlayerInfo.coins)
		$Item3.hide()
	print(PlayerInfo.unused_faces)


func _on_Exit_pressed():
	get_tree().change_scene("res://src/Map/Map.tscn")
