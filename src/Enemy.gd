extends TextureRect

var shield=0
var HP=1
var maxHP=1

func _ready():
	pass 

func update_ui():
	print("Enemy(HP=%d/%d, shield=%d)"%[HP,maxHP,self.shield])
	
	var HPBar=self.get_node("../EnemyHP")

func add_shield(value):
	shield+=value
	self.update_ui()

func damage(value):
	value = max(value - self.shield, 0)
	
	HP = clamp(HP - value, 0, maxHP)
	if(HP==0):
		get_tree().change_scene("res://src/Map/Map.tscn")
		# FUCKING DIE
		
	self.update_ui()
