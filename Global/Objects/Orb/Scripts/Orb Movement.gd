extends Node2D

# Variables ----------------------------------------------------------------------------------------

# Orb Settings
var distanceToEnd
var distanceToTravel
var startOnBeat
var endOnBeat
var speedToTravel

# Orb Initial Position
@onready var orbPosition = $Hitbox.position.x

# Easing Extension
var easeExt = 3

# Functions ----------------------------------------------------------------------------------------

func _physics_process(_delta):
	distanceToEnd = distanceToTravel - (speedToTravel * (float(global.beat) - startOnBeat))
	
	var tween = create_tween()
	tween.set_parallel()
	tween.set_ease(Tween.EASE_OUT_IN)
	tween.tween_property($Hitbox, "position", Vector2(orbPosition + distanceToEnd, 0), global.moveTime + easeExt)
