extends Button

# Variables ----------------------------------------------------------------------------------------

# Scenes
@export var mainMenu : PackedScene = load("res://Menus/Main Menu/Main Menu.tscn")

# Functions ----------------------------------------------------------------------------------------

func _ready():
	self.visible = !global.useCursor

func _physics_process(_delta):
	if Input.is_action_pressed("Escape"):
		_toMainMenu()

func _clicked() -> void:
	_toMainMenu()

func _toMainMenu() -> void:
		get_tree().change_scene_to_packed(mainMenu)
