extends Node2D

# Variables ----------------------------------------------------------------------------------------

# Orb Settings
var distanceToEnd
var distanceToTravel
var startOnBeat
var endOnBeat
var speedToTravel

# The Previous Beat Selected With The Timeline
var previousBeat

# Orb Initial Position
@onready var orbPosition = $Hitbox.position.x

# Functions ----------------------------------------------------------------------------------------

func _physics_process(_delta):
	if global.mmBeat != previousBeat:
		if startOnBeat <= global.mmBeat and endOnBeat >= global.mmBeat:
			self.visible = true
			distanceToEnd = distanceToTravel - (speedToTravel * (float(global.mmBeat) - startOnBeat))
			
			if global.editing:
				var tween = create_tween()
				tween.tween_property($Hitbox, "position", Vector2(orbPosition + distanceToEnd, 0), global.mmMoveTime)
		else:
			self.visible = false
		previousBeat = global.mmBeat
