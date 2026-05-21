extends Button

# Variables ----------------------------------------------------------------------------------------

# File Path
var userPath = OS.get_data_dir()

# File Reader
var reader = ZIPReader.new()

# Scenes
var mapMaker = "res://Screens/Map Maker/Map Maker.tscn"

# Map File Name
var mapFileName = "map.json"

var hovered = false

# Functions ----------------------------------------------------------------------------------------
func _on_pressed():
	var filePath = userPath + "/SpinR/" + self.text +".spr"
	
	reader.open(filePath)
	
	# The unproccessed and unusable contents of the file
	var mapRawData = reader.read_file(mapFileName)
	
	# Make the raw data readable as text
	var mapString = mapRawData.get_string_from_utf8()
	
	# Makes the readable data usable by the game
	var parseMapData = JSON.parse_string(mapString)
	var mapTemp = parseMapData
	
	# Stores the information in its respective places
	global.mmTitle = mapTemp.title
	global.mmMap = mapTemp.beatMap
	global.mmBPM = mapTemp.BPM
	global.mmAudioFile
	# Set the audio Select Text Back to "Select" Since File Isn't Gathered
	global.mmMapSelect = "Select"
	
	# Closes all opened files to avoid unneccesary recourse usage
	reader.close()
	
	# Return to Map Maker
	get_tree().change_scene_to_file(mapMaker)

# Cursor Function
func _physics_process(_delta):
	if hovered:
		self.disabled = true
	else:
		self.disabled = false
	
	if Input.is_action_just_pressed("Accept"):
		_on_pressed()

func _cursor_over(area: Area2D):
	if area.is_in_group("cursor"):
		hovered = true

func _cursor_off(area: Area2D):
	if area.is_in_group("cursor"):
			hovered = false
