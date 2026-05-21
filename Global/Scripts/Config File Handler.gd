extends Node

# Variables ----------------------------------------------------------------------------------------

var config = ConfigFile.new()
var userPath = OS.get_data_dir()
var settingsFilePath = userPath + "/SpinR/settings.ini"

# Functions

func _ready():
	if !FileAccess.file_exists(settingsFilePath):
		config.set_value("input", "inputMethod", "mouse")
		config.set_value("input", "useCursor", false)
		
		config.save(settingsFilePath)
	else:
		config.load(settingsFilePath)

func save_input_setting(key: String, value):
	config.set_value("input", key, value)
	config.save(settingsFilePath)

func load_input_settings():
	var inputSettings = {}
	for key in config.get_section_keys("input"):
		inputSettings[key] = config.get_value("input", key)
	return inputSettings
