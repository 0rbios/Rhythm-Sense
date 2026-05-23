extends Control

# Variables ----------------------------------------------------------------------------------------

@export var mapPlayer : PackedScene

var mapName : String

var hovered = false

@onready var buttonChild : Node = $Button

# Functions ----------------------------------------------------------------------------------------

func _ready() -> void:
	buttonChild.text = mapName

func _process(_delta) -> void:
	if hovered:
		buttonChild.disabled = true
	else:
		buttonChild.disabled = false
	
	if Input.is_action_just_pressed("Accept"):
		if hovered:
			_pressed()

func _cursor_over(area: Area2D) -> void:
	if area.is_in_group("cursor"):
		hovered = true

func _cursor_off(area: Area2D) -> void:
	if area.is_in_group("cursor"):
			hovered = false

func _pressed() -> void:
	global.mapTitle = mapName
	if mapPlayer:
		get_tree().change_scene_to_packed(mapPlayer)
	else:
		print("Oops, something went wrong!")
