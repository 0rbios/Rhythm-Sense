extends Sprite2D

# Variables ----------------------------------------------------------------------------------------

# Preload Assets
var add = preload("res://Objects/Map Maker/Marker/Assets/Add Marker.png")
var del = preload("res://Objects/Map Maker/Marker/Assets/Delete Marker.png")

# 0: Add
# 1: Delete
@export var markerType: int
# Where to Remove the Beat in the Event of Deletion
var beatRef : int

# Scenes
var mapMaker = "res://Screens/Map Maker/Map Maker.tscn"

var hovered = false
var yesHovered = false
var noHovered = false

# Functions ----------------------------------------------------------------------------------------

func _ready():
	match markerType:
		0:
			self.texture = add
		1:
			self.texture = del

func _physics_process(_delta):
	$"Delete Background/Yes/Hitbox".monitoring = $"Delete Background".visible
	$"Delete Background/No/Hitbox".monitoring = $"Delete Background".visible
	$Clickbox.disabled = global.focused
	
	if Input.is_action_just_pressed("Accept"):
		if hovered == true:
			_on_clickbox_pressed()
		elif yesHovered == true:
			_on_yes_pressed()
		elif noHovered == true:
			_on_no_pressed()

func _on_clickbox_pressed():
	$"Delete Background".visible = true
	global.focused = true

func _on_yes_pressed():
	global.mmMap.remove_at(beatRef)
	get_tree().change_scene_to_file(mapMaker)
	global.focused = false

func _on_no_pressed():
	$"Delete Background".visible = false
	global.focused = false
	
func _cursor_over(area: Area2D):
	hovered = true

func _cursor_off(area: Area2D):
	hovered = false

func _yes_cursor_over(area: Area2D):
	yesHovered = true

func _yes_cursor_off(area: Area2D):
	yesHovered = false

func _no_cursor_over(area: Area2D):
	noHovered = true

func _no_cursor_off(area: Area2D):
	noHovered = false
	
