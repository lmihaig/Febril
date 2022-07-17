extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var dice_id=-1
var selected_face=-1

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(get_child_count()):
		get_child(i).connect("gui_input", self,"set_face",[i])
	pass # Replace with function body.


func get_selected_face(): return selected_face

func edit_dice(new_dice_id):
	print("edit_dice")
	if dice_id==new_dice_id:
		return
		
	dice_id=new_dice_id
	if selected_face!=-1:
		get_child(selected_face).get_child(0).visible=false
		selected_face=-1
		
	
	update_faces()
	
func update_faces():
	var dice=PlayerInfo.dice_bag[dice_id]
	var faces=dice.get_child(0).get_faces()
	for i in range(get_child_count()):
		self.get_child(i).texture=faces[i].get_texture()
		
		
func set_face(event, face_id):
	if event is InputEventMouseButton and event.pressed and dice_id!=-1:
		if selected_face!=-1:
			get_child(selected_face).get_child(0).visible=false
		get_child(face_id).get_child(0).visible=true
		
		selected_face=face_id
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
