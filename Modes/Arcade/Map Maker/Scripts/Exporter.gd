extends Button

# Variables ----------------------------------------------------------------------------------------

# File Path
var userPath = OS.get_data_dir()

# File Names
var audioFileName = "audio.mp3"
var mapFileName = "map.json"

# Scenes
var mainMenu = "res://Screens/Main Menu/Main Menu.tscn"

# Functions ----------------------------------------------------------------------------------------

func _on_pressed():
	var exportMap = []
	
	while global.mmMap.size() > 0:
		var currentI = 0
		var current = global.mmMap[0]
		
		for i in range(global.mmMap.size()):
			if global.mmMap[i].start < current.start:
				currentI = i
				current = global.mmMap[i]
		
		global.mmMap.remove_at(currentI)
		exportMap.push_back(current)
	
	var filePath = userPath + "/SpinR/" + global.mmTitle + ".spr"
	var JSONPacket = {"title": "", "BPM": 0, "beatMap": []}
	
	JSONPacket.title = global.mmTitle
	JSONPacket.BPM = global.mmBPM
	JSONPacket.beatMap = exportMap
	
	if not FileAccess.file_exists(filePath):
		var writer = ZIPPacker.new()
		writer.open(filePath)
		
		var mapJSON = JSON.stringify(JSONPacket)
		var mapConvert = mapJSON.to_utf8_buffer()
		
		writer.start_file(mapFileName)
		writer.write_file(mapConvert)
		writer.close_file()
		
		var audioFile = FileAccess.open(global.mmMapSelect, FileAccess.READ)
		var audioData = audioFile.get_buffer(audioFile.get_length())
		audioFile.close()
		
		writer.start_file(audioFileName)
		writer.write_file(audioData)
		writer.close()
		
		get_tree().change_scene_to_file(mainMenu)

func _physics_process(_delta):
	if Input.is_action_just_pressed("Load") and global.editing == true:
		_on_pressed()
