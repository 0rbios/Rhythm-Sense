extends Control

# Variables ----------------------------------------------------------------------------------------

# Scenes
var mapMaker = "res://Screens/Map Maker/Map Maker.tscn"

# Functions ----------------------------------------------------------------------------------------

func _ready():
	if global.editing == true:
		$"Detail Edit".visible = false
		$Editor.visible = true

	else:
		if global.mmTitle != null:
			$"Detail Edit/Menu Background/Title Text/Title Input".text = global.mmTitle
			$"Detail Edit/Menu Background/BPM Text/BPM Display".text = str(global.mmBPM)
			$"Detail Edit/Menu Background/Music File Text/Select Button".text = global.mmMapSelect
		$"Detail Edit".visible = true
		$Editor.visible = false
		$"Detail Edit/Menu Background/BPM Text/BPM Down/Hitbox".monitoring = true
		$"Detail Edit/Menu Background/Music File Text/Select Button/Hitbox".monitoring = true
		$"Editor/Play Button/Hitbox".monitoring = false
	
	if global.inputType == "controller":
		$"Detail Edit/Menu Background/Save".disabled = true
		$"Detail Edit/Menu Background/Load".disabled = true
		$"Editor/Hide While Playing/Settings".disabled = true
		$"Editor/Hide While Playing/Export Button".disabled = true
		$"Detail Edit/Menu Background/Save".text = "Done (Y)"
		$"Detail Edit/Menu Background/Load".text = "Load (X)"
		$"Editor/Hide While Playing/Settings".text = "(Y) Map Settings"
		$"Editor/Hide While Playing/Export Button".text = "(X) Export & Exit"
	else:
		$"Detail Edit/Menu Background/Save".disabled = false
		$"Detail Edit/Menu Background/Load".disabled = false
		$"Editor/Hide While Playing/Settings".disabled = false
		$"Editor/Hide While Playing/Export Button".disabled = false
		$"Detail Edit/Menu Background/Save".text = "Done"
		$"Detail Edit/Menu Background/Load".text = "Load"
		$"Editor/Hide While Playing/Settings".text = "Map Settings"
		$"Editor/Hide While Playing/Export Button".text = "Export & Exit"

func _on_save_pressed():
	if $"Detail Edit/Menu Background/Title Text/Title Input".text != "" and $"Detail Edit/Menu Background/Music File Text/Select Button".text != "Select":
		global.mmTitle = $"Detail Edit/Menu Background/Title Text/Title Input".text
		global.mmBPM = int($"Detail Edit/Menu Background/BPM Text/BPM Display".text)
		global.mmMoveTime = 1.0 / (float(global.mmBPM) / 60.0)

		var file = FileAccess.open($"Detail Edit/Menu Background/Music File Text/Select Button".text, FileAccess.READ)
		global.mmMapSelect = $"Detail Edit/Menu Background/Music File Text/Select Button".text
		var data = file.get_buffer(file.get_length())
		file.close()
		global.mmAudioFile = AudioStreamMP3.load_from_buffer(data)
		$"Editor/Audio File Player".stream = global.mmAudioFile
		global.mmTrackLengthSec = $"Editor/Audio File Player".stream.get_length()
		
		var tickNum = float(float(global.mmBPM) / 60) * float(global.mmTrackLengthSec)
		global.tickCount = tickNum
		$"Editor/Hide While Playing/Timeline".max_value = int(tickNum)
		$"Editor/Hide While Playing/Timeline".tick_count = int(tickNum)
		
		global.editing = true
		
		get_tree().change_scene_to_file(mapMaker)

func _open_menu():
	global.editing = false
	get_tree().change_scene_to_file(mapMaker)

func _physics_process(_delta):
	if Input.is_action_just_pressed("Submit"):
		if global.editing == false:
			_on_save_pressed()
		elif global.editing == true:
			_open_menu()
