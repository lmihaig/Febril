extends Node

var faces

func set_faces(faces):
	self.faces = faces
	return self

func get_faces():
	return self.faces.duplicate()

func _to_string():
	return "Dice" + str(faces)

func info():
	return str(self)

func trigger():
	var chosen_faces = []
	print(self.faces)

	for i in range(3):
		chosen_faces.append(self.faces.pop_at(randi()%(6-i)))

	# print("chosen: ", chosen_faces)
	get_node("/root/Combat/DiceSellector").start_sellection(chosen_faces)

	return chosen_faces
