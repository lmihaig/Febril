extends Node

export(int) var shown_dice
export(int) var distance_between_dice=10


const Dice_obj=preload("res://src/Dice/Dice.tscn")

var base_position



var dice_in_tower=[]
var dice_shown=[]
var dice_owned=[]



# Called when the node enters the scene tree for the first time.
func _ready():
	self.base_position=Dice_obj.instance().position
	print("Ready")
	for i in range(shown_dice):
		if not self.add_dice():
			break

func set_dice(new_dice):
	self.dice_owned=new_dice
	
	self.reload()

func reload():
	self.dice_in_tower=dice_owned.duplicate()
	self.dice_in_tower.shuffle()
	
	for _i in range(shown_dice):
		self.add_dice()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func use_dice(used_dice):
	pass
	# dice action
	used_dice.get_child(0).trigger()
	
	used_dice.queue_free()
	self.remove_child(used_dice)
	
	self.update_tower()
	self.add_dice()
	

func add_dice():
	
#	TODO use dice from tower
	if len(dice_in_tower)==0:
		return false
		
	var new_dice=dice_in_tower.pop_front()
	
	var new_dice_object=Dice_obj.instance()
	
	var sprite_height=new_dice_object.get_child(0).texture.get_height()
	new_dice_object.position=base_position-Vector2(0,(sprite_height*1.5+distance_between_dice)*self.get_child_count())
	
	self.add_child(new_dice_object)
	
	return true

func update_tower():
	for i in range(self.get_child_count()):
		var dice=self.get_child(i)
		var sprite_height=dice.get_child(0).texture.get_height()
		dice.position=base_position-Vector2(0,(sprite_height*1.5+distance_between_dice)*i)
