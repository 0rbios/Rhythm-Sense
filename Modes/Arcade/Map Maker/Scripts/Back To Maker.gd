extends Button

func _ready():
	if global.inputType == "controller":
		visible = false
	else:
		visible = true

func _on_pressed():
	get_tree().change_scene_to_file("res://Screens/Map Maker/Map Maker.tscn")
