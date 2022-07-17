extends Node

const plane_len = 22
const path_count = 8
const node_count = plane_len * plane_len / path_count
const map_scale = 31
var generated = false
var events = {}
var event_info = {}
var event_scene = preload("res://src/Map/Event.tscn")
var generator = preload("res://src/Map/MapGenerator.gd").new()
var map_data = generator.generate(plane_len, node_count, path_count)
