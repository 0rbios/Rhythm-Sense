extends AudioStreamPlayer2D

func _on_finished():
	get_tree().change_scene_to_file("res://scenes/ui_0_main_menu.tscn")
	global.beat = 0
	global.hitOrbs = 0.0
	global.missedOrbs = 0.0
