extends Control

var dice_id=-1

func edit_dice(new_dice_id):
	if dice_id==new_dice_id:
		return
	
	dice_id=new_dice_id
	get_node("MarginContainer/VBoxContainer/HBoxContainer/Selected_Face").edit_dice(dice_id)
	print(dice_id)

func swap_with(unused_face_id):
	print("dice_id ", dice_id)
	if dice_id==-1:
		return
	
	var face_selector=get_node("MarginContainer/VBoxContainer/HBoxContainer/Selected_Face")
	
	var dice_face_id=face_selector.get_selected_face()
	print("dice_face_id ", dice_face_id)
	if dice_face_id==-1:
		return
		
	var dice_faces=PlayerInfo.dice_bag[dice_id].get_child(0).get_faces()
	var old_face=dice_faces[dice_face_id]
	dice_faces[dice_face_id]=PlayerInfo.unused_faces[unused_face_id]
	PlayerInfo.dice_bag[dice_id].get_child(0).set_faces(dice_faces)
	
	PlayerInfo.unused_faces[unused_face_id]=old_face
	print("swap_done")
	
	get_node("MarginContainer/VBoxContainer/HBoxContainer/Selected_Face").update_faces()


func _on_Exit_pressed():
	get_tree().change_scene("res://src/Map/Map.tscn")
