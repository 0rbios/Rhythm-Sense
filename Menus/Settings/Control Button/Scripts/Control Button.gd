extends Control

var icon : String # UID Of Image
var iconHighlight : String # UID Of Image
var controlType : String
var useCursor : bool
var checkFor : bool

@onready var handler : Node = get_parent()
@onready var sprite : Node = $Icon

func _ready() -> void:
	if global.inputType == controlType:
		sprite.texture = load(iconHighlight)
	else:
		sprite.texture = load(icon)
	
	if checkFor == true:
		if Input.get_connected_joypads().size() == 0:
			self.visible = false

func setType() -> void:
	global.inputType = controlType
	global.useCursor = useCursor
	ConfigFileHandler.save_input_setting("inputMethod", controlType)
	ConfigFileHandler.save_input_setting("useCursor", useCursor)
	get_tree().reload_current_scene()
	
func _hoveredOver(area: Area2D) -> void:
	if area.is_in_group("cursor"):
		handler.hoveredOption = self

func _hoverLeave(area: Area2D) -> void:
	if area.is_in_group("cursor"):
		handler.hoveredOption = null

func _clickToSet() -> void:
	setType()
