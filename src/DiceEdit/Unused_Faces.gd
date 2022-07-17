extends GridContainer


var face_template=preload("res://src/DiceEdit/UnusedFace.tscn")

func _ready():
	for i in range(len(PlayerInfo.unused_faces)):
		var item_obj=face_template.instance()
#		item_obj._init(PlayerInfo.unused_faces[i])
		init_face(item_obj, PlayerInfo.unused_faces[i])
		
		add_child(item_obj)
		item_obj.connect("gui_input",self,"swap_with",[i])

func init_face(face_object, face):
	face_object.texture=face.get_texture()

func swap_with(event, face_id):
	if event is InputEventMouseButton and event.pressed:
		print(face_id)
		get_node("/root/DiceEdit").swap_with(face_id)
		init_face(get_child(face_id), PlayerInfo.unused_faces[face_id])
