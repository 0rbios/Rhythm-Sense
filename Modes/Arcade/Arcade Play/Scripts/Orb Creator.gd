extends Node2D

# Variables ----------------------------------------------------------------------------------------

@export var orb : PackedScene
@export var orbParent : Node2D

# What Orb is Currently Waiting
var currentOrb = 0

# Distance to End
var dist = 216.0

# Functions ----------------------------------------------------------------------------------------

func _create_timer_out() -> void:
	if global.map.size() > 0:
		if global.map[currentOrb].start == global.beat:
			
			$"..".rotation = global.map[currentOrb].angle
			
			if orb and orbParent:
				var orbInstance = orb.instantiate()
				
				orbInstance.distanceToEnd = dist
				orbInstance.distanceToTravel = orbInstance.distanceToEnd
				orbInstance.startOnBeat = global.map[currentOrb].start
				orbInstance.endOnBeat = global.map[currentOrb].end
				orbInstance.speedToTravel = orbInstance.distanceToTravel / (orbInstance.endOnBeat - orbInstance.startOnBeat)
				
				orbInstance.look_at($"..".position)
				
				self.add_child(orbInstance)
				orbInstance.reparent(orbParent)
			else:
				print("Oops, something went wrong!")
				return
			
			if currentOrb + 1 < global.map.size():
				currentOrb += 1
