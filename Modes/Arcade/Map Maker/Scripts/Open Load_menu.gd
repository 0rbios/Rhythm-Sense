extends Button

func _on_pressed():
	get_tree().change_scene_to_file("res://Screens/Map Maker Select/Map Selection.tscn")

func _physics_process(_delta):
	if Input.is_action_just_pressed("Load") and global.editing == false:
		_on_pressed()
