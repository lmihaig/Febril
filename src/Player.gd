extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var shield=0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_ui():
	print("Player(HP=%d/%d, shield=%d)"%[PlayerInfo.HP,PlayerInfo.maxHP,self.shield])
	
	var HPBar=self.get_node("../PlayerHP")

func add_shield(value):
	shield+=value
	self.update_ui()

func damage(value):
	value = max(value - self.shield, 0)
	
	PlayerInfo.HP = clamp(PlayerInfo.HP - value, 0, PlayerInfo.maxHP)
	if(PlayerInfo.HP==0):
		pass
		# FUCKING DIE
		
	self.update_ui()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
