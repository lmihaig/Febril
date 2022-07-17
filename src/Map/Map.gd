extends Node2D

const plane_len = 22
const path_count = 8
const node_count = plane_len * plane_len / path_count

const map_scale = 31

var events = {}
var event_scene = preload("res://src/Map/Event.tscn")

func _ready():
	var generator = preload("res://src/Map/MapGenerator.gd").new()
	var map_data = generator.generate(plane_len, node_count, path_count)
	
	for k in map_data.nodes.keys():
		var point = map_data.nodes[k]
		var event = event_scene.instance()
		event._init(k)
		event.position = point * map_scale + Vector2(300, 0)
		
		add_child(event)
		events[k] = event
		
	for path in map_data.paths:
		for i in range(path.size() - 1):
			var index1 = path[i]
			var index2 = path[i + 1]
			
			events[index1].add_child_event(events[index2])
	
	self.make_event_buttons()

func make_event_buttons():
	for child in self.get_children():
		if child is Button:
			self.remove_child(child)
	
	for event in events[PlayerInfo.map_position].children:
		var button = Button.new()
		if event.encounterType != 4:
			var pos_x = event.position[0] - 10
			var pos_y = event.position[1] - 10
			button.set_position(Vector2(pos_x, pos_y))
			button.set_size(Vector2(20, 20))
		else:
			var pos_x = event.position[0] - 15
			var pos_y = event.position[1] - 10
			button.set_position(Vector2(pos_x, pos_y))
			button.set_size(Vector2(25, 20))
		button.flat = true
		button.connect("pressed", self, "move", [event.index, event.encounterType])
		button.show()
		add_child(button)

func move(index, encounterType):
	PlayerInfo.map_position = index
	self.make_event_buttons()
	if encounterType == 1 or encounterType == 2 or encounterType == 5:
		get_tree().change_scene("res://src/Combat.tscn")
