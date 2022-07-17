extends Node2D

var generated = false

func _ready():
	if not generated:
		for k in MapInfo.map_data.nodes.keys():
			var point = MapInfo.map_data.nodes[k]
			var event = MapInfo.event_scene.instance()
			event._init(k)
			event.position = point * MapInfo.map_scale + Vector2(300, 0)
			
			add_child(event)
			MapInfo.events[k] = event
			
		for path in MapInfo.map_data.paths:
			for i in range(path.size() - 1):
				var index1 = path[i]
				var index2 = path[i + 1]
				
				MapInfo.events[index1].add_child_event(MapInfo.events[index2])
		generated = true
		
	self.make_event_buttons()

func make_event_buttons():
	if len(MapInfo.event_info.values()) != 0:
		for event in MapInfo.events:
			MapInfo.events[event].texture = MapInfo.event_info[event][0]
			MapInfo.events[event].encounterType = MapInfo.event_info[event][1]
			
	for child in self.get_children():
		if child is Button or child is Label:
			self.remove_child(child)
			
	var here = Label.new()
	here.set_global_position(Vector2(
		MapInfo.events[PlayerInfo.map_position].position[0]-34, 
		MapInfo.events[PlayerInfo.map_position].position[1]-7)
	)
	here.text = "--->"
	here.add_color_override("font_color", Color.black)
	here.show()
	add_child(here)
	
	for event in MapInfo.events[PlayerInfo.map_position].children:
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
		button.connect("mouse_entered", self, "focus", [event.position])
		button.connect("mouse_exited", self, "unfocus")
		button.show()
		add_child(button)

func move(index, encounterType):
	PlayerInfo.map_position = index
	self.make_event_buttons()
	
	if len(MapInfo.event_info.values()) == 0:
		save_events()
	if encounterType == 1 or encounterType == 2 or encounterType == 5:
		get_tree().change_scene("res://src/Combat.tscn")
	if encounterType == 3:
		get_tree().change_scene("res://src/Shop.tscn")
	if encounterType == 4:
		get_tree().change_scene("res://src/Rest.tscn")

func focus(position):
	print(position)
	var label = Label.new()
	label.set_global_position(Vector2(position[0]-30, position[1]-7))
	label.text = "-->"
	label.add_color_override("font_color", Color.black)
	label.show()
	add_child(label)
	
func unfocus():
	for child in self.get_children():
		if child is Label and child.text != "--->":
			self.remove_child(child)

func save_events():	
	for event in MapInfo.events:
		MapInfo.event_info[MapInfo.events[event].index] = [MapInfo.events[event].texture, MapInfo.events[event].encounterType]
