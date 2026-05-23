extends VBoxContainer

# Variables ----------------------------------------------------------------------------------------

var mapsPath = OS.get_data_dir() + "/Rhythm Sense/Maps"
@export var button : PackedScene
@export var fileExtension : String

# Functions ----------------------------------------------------------------------------------------

func _ready() -> void:
	var mapsList = Array(DirAccess.get_files_at(mapsPath))
	if mapsList.filter(fileTypeCorrect).size() > 1:
		print("No Maps Found")

func fileTypeCorrect(file) -> void:
	if file.get_extension() == fileExtension:
		var instance = button.instantiate()
		instance.mapName = file.replace("." + fileExtension, "")
		self.add_child(instance)
