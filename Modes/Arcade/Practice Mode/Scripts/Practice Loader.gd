extends Node2D

func _ready():
	global.BPM = 100
	
	# Set the BPM timer
	$"Spawn BPM Timer".wait_time = 1.0 / (float(global.BPM) / 60.0)
	global.moveTime = 1.0 / (float(global.BPM) / 60.0)
