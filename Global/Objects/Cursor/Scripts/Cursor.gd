extends MeshInstance2D

# Variables ----------------------------------------------------------------------------------------

const speed = 7

# Functions ----------------------------------------------------------------------------------------

func _ready() -> void:
	if global.useCursor:
		self.position.x = get_viewport().size.x / 2
		self.position.y = get_viewport().size.y / 2
		self.visible = true
	else:
		self.visible = false

func _process(_delta) -> void:
	var inputDir: Vector2 = Input.get_vector("axis_left", "axis_right", "axis_up", "axis_down")
	self.global_position += inputDir * speed
