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

func damage(value):
	value = max(value - self.shield, 0)
	
	HP = clamp(HP - value, 0, maxHP)
	if(HP==0):
		pass
		# FUCKING DIE
		
	self.update_ui()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
