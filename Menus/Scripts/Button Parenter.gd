extends Control

# This script is responsible for setting all buttons to point to the same menu parent node

@export var menuParent : Node
@onready var menuButtons : Array[Node] = self.get_children()

func _ready() -> void:
	for button in menuButtons:
		if menuParent:
			button.menuParent = menuParent
		else:
			button.menuParent = self.get_parent()
