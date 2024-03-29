extends Area2D

var selected = false
var locked=false
var inital_pos
#export(int) var id_in_tower

func _ready():
	inital_pos = position


func lock():
	locked=true
	
func unlock():
	locked=false
	
func get_height():
	return 50

func _on_DiceBottom_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click") and not locked:
		selected = true

func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25*delta)
		
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed and selected:
			selected = false
			var distance = position.distance_to(inital_pos)
			if distance < 55:
				position = inital_pos
			else:
				self.visible = false
				self.get_parent().use_dice(self)

func _to_string():
	return str(self.get_child(0))
