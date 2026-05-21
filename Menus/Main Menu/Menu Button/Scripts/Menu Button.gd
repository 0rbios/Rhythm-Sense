extends Control

# This script is responsible for assigning default/set button values including:

# The text the button will display
@export var buttonText : String = "<Something Went Wrong>"
# What will happen when the button is pressed
@export var executeScript : Script

@onready var menuParent : Node
@onready var buttonLabel = $"Button Text"

func _ready() -> void:
	buttonLabel.text = buttonText

func _touchedSomething(area: Area2D) -> void:
	if area.is_in_group("wacker"):
		menuParent.selectedOption = self

func _noSelection(area: Area2D) -> void:
	if area.is_in_group("wacker") and menuParent.selectedOption == self:
		menuParent.selectedOption = null
