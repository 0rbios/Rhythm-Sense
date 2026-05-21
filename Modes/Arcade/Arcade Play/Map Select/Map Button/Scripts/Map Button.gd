extends Button

# Variables ----------------------------------------------------------------------------------------

# Gameplay Scene
var gameplaySceneString = "res://Screens/Play Mode/Map Player.tscn"

var hovered = false

# Functions ----------------------------------------------------------------------------------------

# Main Function
func _on_pressed():
	global.mapTitle = self.text
	get_tree().change_scene_to_file(gameplaySceneString)

# Cursor Function
func _physics_process(_delta):
	if hovered:
		self.disabled = true
	else:
		self.disabled = false
	
	if Input.is_action_just_pressed("Accept"):
		_on_pressed()

func _cursor_over(area: Area2D):
	if area.is_in_group("cursor"):
		hovered = true

func _cursor_off(area: Area2D):
	if area.is_in_group("cursor"):
			hovered = false
