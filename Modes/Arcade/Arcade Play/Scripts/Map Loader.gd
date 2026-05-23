extends Node2D

# Variables ----------------------------------------------------------------------------------------

var reader = ZIPReader.new()

var mapPath = OS.get_data_dir() + "/Rhythm Sense/Maps/" + global.mapTitle +".rsm"

# Functions ----------------------------------------------------------------------------------------

func _ready() -> void:
	reader.open(mapPath)
	
	var mapRawData = reader.read_file("map.json")
	var mapString = mapRawData.get_string_from_utf8()
	var parseMapData = JSON.parse_string(mapString)
	var mapTemp = parseMapData
	
	global.map = mapTemp.beatMap
	global.BPM = mapTemp.BPM
	
	var audioFile = reader.read_file("audio.mp3")
	var audio = AudioStreamMP3.load_from_buffer(audioFile)
	
	$"Music Player".stream = audio
	$"Spawn BPM Timer".wait_time = 1.0 / (float(global.BPM) / 60.0)
	global.moveTime = 1.0 / (float(global.BPM) / 60.0)
	
	reader.close()
