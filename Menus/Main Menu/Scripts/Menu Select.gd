extends Node2D

# Variables ----------------------------------------------------------------------------------------

# Hovering Selector
var selectedOption : Node

# Buttons
@export var buttons : Array[Node]

# File Path
var gameDataPath : String = OS.get_data_dir() + "/Rhythm Sense/"

# Functions ----------------------------------------------------------------------------------------

func _ready() -> void:
	var loadedSettings = ConfigFileHandler.load_input_settings()
	global.inputType = loadedSettings.inputMethod
	global.useCursor = loadedSettings.useCursor
	
	DirAccess.make_dir_recursive_absolute(gameDataPath)
	
	if Input.get_connected_joypads().size() == 0:
		global.inputType = "mouse"
		global.useCursor = false
	
	global.focused = false
	global.mmTitle = null
	global.mmBPM = null
	global.mmAudioFile = null
	global.mmTrackLengthSec = null
	global.mmMapSelect = null
	global.editing = false
	global.mmMap = []

func _input(event: InputEvent) -> void:
	# !IMPORTANT! All button scripts must have an "execute" function to run correctly
	
	if event.is_action_pressed("Accept"):
		if selectedOption:
			if selectedOption.executeScript:
				var script = selectedOption.executeScript.new()
				if script.has_method("execute"):
					script.execute(get_tree())
