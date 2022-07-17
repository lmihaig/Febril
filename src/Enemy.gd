extends TextureRect

var shield=0
var HP=1
var maxHP=1
var reward = 10


func _ready():
	pass 

func update_ui():
	print("Enemy(HP=%d/%d, shield=%d)"%[HP,maxHP,self.shield])
	
	var HPBar=self.get_node("../EnemyHP")

func add_shield(value):
	shield+=value
	self.update_ui()

func subtract_shield(dmg):
	var subtracted_dmg=clamp(dmg,0,self.shield)
	self.shield-=subtracted_dmg
	return dmg-subtracted_dmg

func damage(value):
	value=subtract_shield(value)
	
	HP = clamp(HP - value, 0, maxHP)
	if(HP==0):
		if PlayerInfo.current_enemy != 6:
			PlayerInfo.coins += reward
			get_tree().change_scene("res://src/Map/Map.tscn")
		else:
			get_tree().change_scene("res://src/Win/Win.tscn")
			
		# FUCKING DIE
		
	self.update_ui()


func play():
	pass
	self.add_shield(1)
	get_node("/root/Combat/PlayerContainer/PlayerStats/Player").damage(2)
	
	get_node("/root/Combat").enemy_done()
