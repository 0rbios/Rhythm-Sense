extends Node2D

# Variables ----------------------------------------------------------------------------------------

# Roaming Folder
var userPath = OS.get_data_dir()

# Map File Path
var filePath = userPath + "/SpinR/" + global.mapTitle +".spr"

# File Reader
var reader = ZIPReader.new()

# Audio File Name
var audioFileString = "audio.mp3"

# Functions ----------------------------------------------------------------------------------------

func _ready():
	# Open Map File
	reader.open(filePath)
	
	# The unproccessed and unusable contents of the file
	var mapRawData = reader.read_file("map.json")
	
	# Make the raw data readable as text
	var mapString = mapRawData.get_string_from_utf8()
	
	# Makes the readable data usable by the game
	var parseMapData = JSON.parse_string(mapString)
	var mapTemp = parseMapData
	
	# Stores the information in its respective places
	global.map = mapTemp.beatMap
	global.BPM = mapTemp.BPM
	
	# Opens and loads the music from the map
	var audioFile = reader.read_file(audioFileString)
	var audio = AudioStreamMP3.load_from_buffer(audioFile)
	
	# Sets the audio player to use the loaded audio
	$"Music Player".stream = audio
	
	# Set the BPM timer
	$"Spawn BPM Timer".wait_time = 1.0 / (float(global.BPM) / 60.0)
	global.moveTime = 1.0 / (float(global.BPM) / 60.0)
	
	# Closes all opened files to avoid unneccesary recourse usage
	reader.close()
