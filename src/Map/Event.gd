extends Node2D

const margin = 10

var children: Array = []


var texture = ImageTexture.new()

	
	
func _ready():
	texture = load("res://assets/sprites/fight.png")
	

func add_child_event(child):
	if !children.has(child):
		children.append(child)
		update()

func _draw():
#	draw_circle(Vector2.ZERO, 4, Color.whitesmoke)

	draw_texture(texture, -texture.get_size()/2)
	
	for child in children:
		var line = child.position - position
		var normal = line.normalized()
		line -= margin * normal
		var color = Color.gray
		draw_line(normal * margin, line, color, 2, true)
