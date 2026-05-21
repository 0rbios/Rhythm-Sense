extends Node2D

# Variables ----------------------------------------------------------------------------------------

@export var orb : PackedScene
@export var orbParent : Node2D
var rng = RandomNumberGenerator.new()
var rngMinimum : int = 0
var rngMaximum : int = 1
var requiredValue : int = 1
var minimumAngle : int = 0
var maximumAngle : int = 360
var minimumEndBeat : int = 1
var maximumEndBeat : int = 5
var centreDistance : float = 216.0

# Functions ----------------------------------------------------------------------------------------

func _create_timer_out():
	if !orb: return
	
	if rng.randi_range(rngMinimum, rngMaximum) == requiredValue :
		$"..".rotation = rng.randf_range(minimumAngle, maximumAngle)
		var orbInstance = orb.instantiate()
		orbInstance.distanceToEnd = centreDistance
		orbInstance.distanceToTravel = orbInstance.distanceToEnd
		orbInstance.startOnBeat = global.beat
		orbInstance.endOnBeat = global.beat + rng.randi_range(minimumEndBeat, maximumEndBeat)
		orbInstance.speedToTravel = orbInstance.distanceToTravel / (orbInstance.endOnBeat - orbInstance.startOnBeat)
		orbInstance.look_at($"..".position)
		self.add_child(orbInstance)
		orbInstance.reparent(orbParent)
