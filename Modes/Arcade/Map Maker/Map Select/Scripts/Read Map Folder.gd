extends VBoxContainer

# Variables ----------------------------------------------------------------------------------------

# File Path
var userPath = OS.get_data_dir()
var mapsPath = userPath + "/SpinR/"

# Map Button
var button = load("res://Objects/Map Maker/Map Button/Map Button.tscn")

# File Extension
var fileExt = "spr"

# Functions ----------------------------------------------------------------------------------------

func fileTypeCorrect(file):
	# Check the file extension of the given file
	if file.get_extension() == fileExt:
		# If the file extension is what we are looking for, then create an instance of the button
		var instance = button.instantiate()
		# Make the buttons text the name of the file without the extension
		var instanceText = instance.get_child(0)
		instanceText.text = file.replace("." + fileExt, "")
		# Create the button from the instance
		self.add_child(instance)

func _ready():
	# Gather all files in the maps folder
	var mapsList = DirAccess.get_files_at(mapsPath)
	# Turn them into an array
	var mapsListArray = Array(mapsList)
	
	# Run the file extension check on each file in the array to get only the correct ones
	if mapsListArray.filter(fileTypeCorrect).size() > 1:
		# If there are no files then this will show a message
		pass
	else:
		# Otherwise we leave as the file has finished executing
		return
