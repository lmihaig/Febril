extends Node2D

const margin = 10
var encounterType = type.Fight
var children: Array = []
enum type {
	Start,
	Fight,
	Elite,
	Shop,
	Rest,
	Finish
	}

var texture = ImageTexture.new()
	
func _ready():
	randomize()
	if encounterType == type.Start or encounterType == type.Finish:
		pass
	else:
		var encounter = randi() % 100
		if encounter in range(70):
			encounterType = type.Fight
		if encounter in range(70,80):
			encounterType = type.Elite
		if encounter in range(80,90):
			encounterType = type.Rest
		if encounter in range(90,100):
			encounterType = type.Shop
	set_details()
	
func set_details():
	match encounterType:
		type.Start:
			texture = load("res://assets/sprites/shop.png")
		type.Finish:
			texture = load("res://assets/sprites/shop.png")
		type.Fight:
			texture = load("res://assets/sprites/fight.png")
		type.Elite:
			texture = load("res://assets/sprites/elite.png")
		type.Shop:
			texture = load("res://assets/sprites/shop.png")
		type.Rest:
			texture = load("res://assets/sprites/rest.png")
	
func add_child_event(child):
	if !children.has(child):
		children.append(child)
		update()

func _draw():
	draw_texture(texture, -texture.get_size()/2)
	print(children)
	
	for child in children:
		var line = child.position - position
		var normal = line.normalized()
		line -= margin * normal
		var color = Color.gray
		draw_line(normal * margin, line, color, 2, true)
