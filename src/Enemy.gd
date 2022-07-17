extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var shield=0
var HP=10
var maxHP=10


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

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
		
		# mark victory
		# cacat cacat
		get_tree().change_scene("res://src/Map/Map.tscn")
		# FUCKING DIE
		
	self.update_ui()


func play():
	pass
	self.add_shield(1)
	get_node("/root/Combat/PlayerContainer/PlayerStats/Player").damage(2)
	
	get_node("/root/Combat").enemy_done()
