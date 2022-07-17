extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

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
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
