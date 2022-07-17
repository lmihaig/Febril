extends Node

var faces

var timer
var face_id=0

func set_faces(faces):
	self.faces = faces
	return self

func get_faces():
	return self.faces.duplicate()

func _to_string():
	return "Dice" + str(faces)

func info():
	return str(self)
	
func start_cycle():
	print("start_cycle")
	timer=Timer.new()
	add_child(timer)
	timer.set_autostart(true)
	timer.connect("timeout",self,"cycle_face")
	timer.set_wait_time(0.5)
	timer.set_one_shot(false)
	timer.start()
	
	cycle_face()
	
	return self

func stop_cycle():
	print("stop_cycle")
	timer.stop()	
	return self	

func cycle_face():
	face_id=(face_id+1)%len(faces)
	self.texture=faces[face_id].get_texture()

func trigger():
	var chosen_faces = []
	print(self.faces)

	for i in range(3):
		chosen_faces.append(self.faces.pop_at(randi()%(6-i)))

	# print("chosen: ", chosen_faces)
	get_node("/root/Combat/DiceSellector").start_sellection(chosen_faces)

	return chosen_faces
