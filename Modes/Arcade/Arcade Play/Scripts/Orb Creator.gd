extends Node2D

# Variables ----------------------------------------------------------------------------------------

# Orb Prefab
var orb = preload("res://Objects/Global/Orb/Orb.tscn")

# Orb Parent Node
@export var orbs : Node2D

# What Orb is Currently Waiting
var currentOrb = 0

# Distance to End
var dist = 216.0

# Functions ----------------------------------------------------------------------------------------

func _create_timer_out():
	if global.map[currentOrb].start == global.beat:
		$"..".rotation = global.map[currentOrb].angle
		var orbInstance = orb.instantiate()
		orbInstance.distanceToEnd = dist
		orbInstance.distanceToTravel = orbInstance.distanceToEnd
		orbInstance.startOnBeat = global.map[currentOrb].start
		orbInstance.endOnBeat = global.map[currentOrb].end
		orbInstance.speedToTravel = orbInstance.distanceToTravel / (orbInstance.endOnBeat - orbInstance.startOnBeat)
		orbInstance.look_at($"..".position)
		self.add_child(orbInstance)
		orbInstance.reparent(orbs)
		if currentOrb + 1 < global.map.size():
			currentOrb += 1
