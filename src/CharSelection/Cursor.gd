extends Sprite

var characters = []
var curSelected = 0
var curCol = 0

export (Texture) var player1Text
export (Vector2) var portraitOffset

onready var gridContainer = get_parent().get_node(".")


func _ready():
	for character in get_tree().get_nodes_in_group("Chars"):
		characters.append(character)
		
	texture = player1Text
	
func _process(_delta):
	if(Input.is_action_just_pressed("right")):
		curSelected += 1
		curCol += 1
		position.x += portraitOffset.x
	
	if(Input.is_action_just_pressed("left")):
		curSelected -= 1
		curCol -= 1
		position.x -= portraitOffset.x
