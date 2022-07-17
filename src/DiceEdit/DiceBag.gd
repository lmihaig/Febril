extends HBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer
var face_ids=[]
export(int) var faces

var selected_dice=-1

# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerInfo.dice_bag
	
	print("start_cycle")
	timer=Timer.new()
	add_child(timer)
	timer.set_autostart(true)
	timer.connect("timeout",self,"cycle_faces")
	timer.set_wait_time(0.5)
	timer.set_one_shot(false)
	timer.start()
	
	for i in PlayerInfo.dice_bag:
		face_ids.append(0)
	
	cycle_faces()
	
	
	return self

func stop_cycle():
	print("stop_cycle")
	timer.stop()	
	return self	

func cycle_faces():
	for i in range(len(PlayerInfo.dice_bag)):
		cycle_face(i)

func cycle_face(dice_id):
	var dice=PlayerInfo.dice_bag[dice_id]
	var faces=dice.get_child(0).get_faces()
	face_ids[dice_id]=(face_ids[dice_id]+1)%len(faces)
	self.get_child(dice_id).texture=faces[face_ids[dice_id]].get_texture()


func dice_selected(dice_id):
	if selected_dice!=-1:
		get_child(selected_dice).get_child(0).visible=false
		pass
	get_child(dice_id).get_child(0).visible=true
	selected_dice=dice_id
	get_node("/root/DiceEdit").edit_dice(dice_id)

func _on_Dice1_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		dice_selected(0)


func _on_Dice2_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		dice_selected(1)


func _on_Dice3_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		dice_selected(2)


func _on_Dice4_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		dice_selected(3)


func _on_Dice5_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		dice_selected(4)
