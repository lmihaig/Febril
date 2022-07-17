extends TextureRect

var shield=0
var HP=1
var maxHP=1
var reward = 10

var HPBar
var HPLabel
var ShieldLabel

func _ready():
	self.HPBar=self.get_node("../EnemyHP")
	self.HPLabel=self.get_node("../EnemyHP/Label")
	self.ShieldLabel=self.get_node("../EnemyBuffs/Def/Label")
	self.HPBar.max_value = maxHP
	self.HPBar.value = HP
	self.HPLabel.text = str(HP) + "/" + str(maxHP)


func update_ui():
	print("Enemy(HP=%d/%d, shield=%d)"%[HP,maxHP,self.shield])
	self.HPBar.value = HP
	self.HPLabel.text = str(HP) + "/" + str(maxHP)
	self.ShieldLabel.text = str(shield)

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
