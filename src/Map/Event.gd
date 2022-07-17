extends Node2D

enum type {
	Start=0,
	Fight=1,
	Elite,
	Shop,
	Rest,
	Finish=5,
	None
}

var encounterType
var index

func _init(index = -1):
	self.index = index
	if index == 0:
		self.encounterType = type.Start
	elif index == 1:
		self.encounterType = type.Finish
	else:
		self.encounterType = type.None

const margin = 10
var children: Array = []


var texture = ImageTexture.new()
	
func _ready():
	randomize()
	if self.encounterType == type.None:
		var encounter = randi() % 100
		if encounter in range(70):
			self.encounterType = type.Fight
		if encounter in range(70,80):
			self.encounterType = type.Elite
		if encounter in range(80,90):
			self.encounterType = type.Rest
		if encounter in range(90,100):
			self.encounterType = type.Shop
	set_details()
	
func set_details():
	match self.encounterType:
		type.Start:
			texture = load("res://assets/sprites/start.png")
		type.Finish:
			texture = load("res://assets/sprites/finish.png")
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
	# print(children)
	
	for child in children:
		var line = child.position - position
		var normal = line.normalized()
		line -= margin * normal
		var color = Color.gray
		draw_line(normal * margin, line, color, 2, true)
