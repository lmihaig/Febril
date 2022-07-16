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

func get_faces():
	return self.faces.duplicate()

func _to_string():
	return "Dice"+str(faces)

func info():
	return str(self)

func trigger():
	var chosen_faces=[]
	print(self.faces)

	for i in range(3):
		chosen_faces.append(self.faces.pop_at(randi()%(6-i)))

	print("chosen: ",chosen_faces)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
