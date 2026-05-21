extends Button

# Variables ----------------------------------------------------------------------------------------

# Scenes
var mainMenu = "res://Screens/Main Menu/Main Menu.tscn"

# Escape Button
var back = "Escape"

# Functions ----------------------------------------------------------------------------------------

func _ready():
	if global.inputType == "controller":
		self.visible = false
	else:
		self.visible = true

func _physics_process(_delta):
	if Input.is_action_pressed(back):
		get_tree().change_scene_to_file(mainMenu)

func _on_pressed():
	get_tree().change_scene_to_file(mainMenu)

func _on_pressed_MMM():
	get_tree().change_scene_to_file(mainMenu)

func _on_pressed_set():
	get_tree().change_scene_to_file(mainMenu)
