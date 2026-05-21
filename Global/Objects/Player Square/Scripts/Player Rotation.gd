extends Marker2D

# Variables ----------------------------------------------------------------------------------------

# Input Names
var typeControl = "controller"
var typeMouse = "mouse"

# Functions ----------------------------------------------------------------------------------------

func _process(_delta):
	match (global.inputType):
		typeControl:
			var joystickPos = Input.get_vector("axis_left", "axis_right", "axis_up", "axis_down")
			look_at(joystickPos)
		typeMouse:
			look_at(get_global_mouse_position())
