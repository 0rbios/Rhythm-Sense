extends HBoxContainer

# Variables ----------------------------------------------------------------------------------------

var hoveredOption : Node
var inputTypesPath : String = "res://Global/Input Types/"
var controlButtonRef : String = "res://Menus/Settings/Control Button/Control Button.tscn"

# Functions ----------------------------------------------------------------------------------------

# Load Setup
func _ready():
	var inputSettings = ConfigFileHandler.load_input_settings()
	global.inputType = inputSettings.inputMethod
	
	var files = DirAccess.get_files_at(inputTypesPath)
	for file in files:
		var openedFile = FileAccess.open((inputTypesPath + file), FileAccess.READ)
		if openedFile:
			var jsonString = openedFile.get_as_text()
			var json = JSON.new()
			var parseCheck = json.parse(jsonString)
			if parseCheck == OK:
				var data = json.data
				if typeof(data) == TYPE_DICTIONARY:
					var controlButton = load(controlButtonRef)
					var controlButtonInstance = controlButton.instantiate()
					controlButtonInstance.controlType = data.get("name", "mouse")
					controlButtonInstance.useCursor = data.get("hasCursor", true)
					controlButtonInstance.icon = data.get("icon", "uid://dkrxlhcqm7qtc")
					controlButtonInstance.iconHighlight = data.get("iconHighlight", controlButtonInstance.icon)
					controlButtonInstance.checkFor = data.get("checkFor", true)
					self.add_child(controlButtonInstance)

# Cursor Function

func _process(_delta) -> void:
	if Input.is_action_just_pressed("Accept"):
		if hoveredOption:
			hoveredOption.setType()
