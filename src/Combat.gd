extends Control

func _ready():
	if PlayerInfo.current_enemy == 3:
		$EnemyContainer/EnemyStats/Enemy.texture = load("res://assets/sprites/diceling3.png")
	elif PlayerInfo.current_enemy == 4:
		$EnemyContainer/EnemyStats/Enemy.texture = load("res://assets/sprites/diceling4.png") 
	elif PlayerInfo.current_enemy == 5:
		$EnemyContainer/EnemyStats/Enemy.texture = load("res://assets/sprites/diceling5.png")
		$EnemyContainer/EnemyStats/Enemy.set_flip_h(false)
	elif PlayerInfo.current_enemy == 6:
		$EnemyContainer/EnemyStats/Enemy.texture = load("res://assets/sprites/diceling6.png") 
	
	$PlayerContainer/PlayerStats/PlayerHP.max_value = PlayerInfo.maxHP
	$PlayerContainer/PlayerStats/PlayerHP.value = PlayerInfo.HP
	$PlayerContainer/PlayerStats/PlayerHP/Label.text = str(PlayerInfo.HP) + "/" + str(PlayerInfo.maxHP)
	$Coin/Label.text = "x" + str(PlayerInfo.coins)

func player_done():
	var player=get_node("PlayerContainer/PlayerStats/Player")
	var enemy=get_node("EnemyContainer/EnemyStats/Enemy")
	enemy.play()
	pass
	
func enemy_done():
	pass
	var player_tower=get_node("PlayerContainer/PlayerTower")
	player_tower.unlock()
	player_tower.add_dice()
	
