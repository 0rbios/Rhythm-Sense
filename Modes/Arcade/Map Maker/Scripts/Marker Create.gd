extends Control

# Variables ----------------------------------------------------------------------------------------

# Screen Info
@onready var screenWidth = get_viewport().size.x
@onready var chunkWidth = screenWidth / global.tickCount

# Marker Prefab
var marker = preload("res://Objects/Map Maker/Marker/Marker.tscn")

# Marker Scale
var markerScale = 0.075

# Functions ----------------------------------------------------------------------------------------

func _ready():
	for i in range(global.mmMap.size()):
		var markerInstance = marker.instantiate()
		markerInstance.markerType = 0
		markerInstance.scale.x = markerScale
		markerInstance.scale.y = markerScale
		markerInstance.beatRef = i
		markerInstance.position.x = chunkWidth * global.mmMap[i].start - 1
		self.add_child(markerInstance)
		
	for i in range(global.mmMap.size()):
		var markerInstance = marker.instantiate()
		markerInstance.markerType = 1
		markerInstance.scale.x = markerScale
		markerInstance.scale.y = markerScale
		markerInstance.beatRef = i
		markerInstance.position.x = chunkWidth * global.mmMap[i].end
		self.add_child(markerInstance)
