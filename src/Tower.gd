extends Node

export(int) var shown_dice
export(int) var distance_between_dice = 10

const Dice_obj = preload("res://src/Dice/Dice.tscn")

var base_position

var dice_in_tower=[]
var dice_shown=[]
var dice_owned=[]

func _ready():
	self.base_position = Dice_obj.instance().position
	self.set_dice(PlayerInfo.dice_bag)
	print("Ready")

func lock():
	for dice in get_children():
		dice.lock()
	pass


func unlock():
	for dice in get_children():
		dice.unlock()
	

func set_dice(new_dice):
	self.dice_owned = new_dice
	self.reload()

func reload():
	self.dice_in_tower = dice_owned.duplicate()
	self.dice_in_tower.shuffle()
	
	for _i in range(shown_dice):
		self.add_dice()

	update_tower()

func use_dice(used_dice):
	# dice action
	var used_faces = used_dice.get_child(0).trigger()
	
	used_dice.queue_free()
	remove_child(used_dice)
	dice_shown.erase(used_dice)
	used_dice.get_child(0).stop_cycle()
	
	
	self.update_tower(false)
	self.lock()

func add_dice():
	
#	TODO use dice from tower
	if len(dice_in_tower) == 0:
		if len(dice_shown) == 0:
			reload()
		return

	var new_dice_template = dice_in_tower.pop_front()
	
	var new_dice_object = new_dice_template.duplicate(15)
	new_dice_object.get_child(0).set_faces(new_dice_template.get_child(0).get_faces())
	
	var sprite_height = new_dice_object.get_height()
	new_dice_object.position = base_position-Vector2(0,(sprite_height+distance_between_dice)*self.get_child_count())
	
	new_dice_object.get_child(0).start_cycle()
	
	self.add_child(new_dice_object)
	
	dice_shown.append(new_dice_object)
	
	return true

func update_tower(can_reload=true):
	for i in range(self.get_child_count()):
		var dice = self.get_child(i)
		var sprite_height = dice.get_height()
		dice.position = base_position-Vector2(0,(sprite_height+distance_between_dice)*i)
	
	if len(dice_in_tower) == 0 and len(dice_shown) == 0 and can_reload:
		reload()
