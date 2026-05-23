extends AudioStreamPlayer2D

@export var mainMenu : PackedScene

func _on_finished() -> void:
	global.beat = 0
	global.hitOrbs = 0.0
	global.missedOrbs = 0.0
	get_tree().change_scene_to_packed(mainMenu)
