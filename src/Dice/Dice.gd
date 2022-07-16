extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var faces

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_faces(faces):
	self.faces=faces
	return self

func trigger():
	print("CE AI ZIS MAAAA")
	print("TU STI CINE IS IO")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
