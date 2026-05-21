extends Button

# Variables ----------------------------------------------------------------------------------------

# Strings
var plus = "+"
var minus = "-"

# Scenes
var mapMaker = "res://Screens/Map Maker/Map Maker.tscn"

var hovered = false

# Functions ----------------------------------------------------------------------------------------

func _on_pressed():
	if self.text == plus:
		self.text = minus
	else:
		self.text = plus
	$Background.visible = !$Background.visible

func create_button_pressed():
	var insertPacket = {"start": int($"Background/Start Input".text), "end": int($"Background/End Input".text), "angle": int($"Background/Angle Input".text)}
	global.mmMap.push_back(insertPacket)
	get_tree().change_scene_to_file(mapMaker)

func _cursor_over(area: Area2D):
	hovered = true

func _cursor_off(area: Area2D):
	hovered = false

func _physics_process(_delta):
	if Input.is_action_just_pressed("Accept") and hovered == true:
		_on_pressed()
