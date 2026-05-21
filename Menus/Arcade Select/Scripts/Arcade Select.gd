extends Node2D

# Variables ----------------------------------------------------------------------------------------

# Hover Selection
var selectedButton = 0

# Scenes
var practiceMode = "res://Screens/Practice Mode/Practice Player.tscn"
var mainMenu = "res://Screens/Main Menu/Main Menu.tscn"
var mapSelector = "res://Screens/Map Select/Map Selection.tscn"

# Select Input
var select = "Accept"

# Colours
var yellow = "#bdc200"
var grey = "#808080"

# Functions ----------------------------------------------------------------------------------------

func _normal_hovered(_area):
	selectedButton = 3

func _exit_hovered(_area):
	selectedButton = 2

func _practice_hovered(_area):
	selectedButton = 1

func _physics_process(_delta):
	match selectedButton:
		1: 
			$Practice.color = yellow
			$Back.color = grey
			$Map.color = grey
		2:
			$Practice.color = grey
			$Back.color = yellow
			$Map.color = grey
		3:
			$Practice.color = grey
			$Back.color = grey
			$Map.color = yellow
		
	if Input.is_action_just_pressed(select):
		match selectedButton:
			1: get_tree().change_scene_to_file(practiceMode)
			3: get_tree().change_scene_to_file(mapSelector)
			2: get_tree().change_scene_to_file(mainMenu)
