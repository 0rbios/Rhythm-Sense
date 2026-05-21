extends Label

# Variables ----------------------------------------------------------------------------------------

# Scenes
@export var mainMenu : PackedScene

# Functions ----------------------------------------------------------------------------------------

func _ready():
	if global.inputType == "controller":
		self.text = "Press 'B' to exit"
	else:
		self.text = "Press 'Esc' to exit"

func _process(_delta):
	if Input.is_action_just_pressed("Escape"):
		global.score = 0
		global.scoreMult = 1.0
		
		if (mainMenu):
			get_tree().change_scene_to_packed(mainMenu)
