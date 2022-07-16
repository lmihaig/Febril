extends Node2D

const plane_len = 24
const path_count = 8
const node_count = plane_len * plane_len / path_count

const map_scale = 24

var events = {}
var event_scene = preload("res://src/Map/Event.tscn")

func _ready():
	var generator = preload("res://src/Map/MapGenerator.gd").new()
	var map_data = generator.generate(plane_len, node_count, path_count)
	
	for k in map_data.nodes.keys():
		var point = map_data.nodes[k]
		var event = event_scene.instance()
		event.position = point * map_scale + Vector2(100, 0)
		
		add_child(event)
		events[k] = event
		
	for path in map_data.paths:
		for i in range(path.size() - 1):
			var index1 = path[i]
			var index2 = path[i + 1]
			
			events[index1].add_child_event(events[index2])
	
	events[0].encounterType = events[0].type.Start
	events[1].encounterType = events[0].type.Finish
	
