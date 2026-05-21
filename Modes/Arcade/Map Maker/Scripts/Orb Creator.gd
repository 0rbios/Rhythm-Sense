extends Marker2D

# Variables ----------------------------------------------------------------------------------------

# Orb Prefab
var orb = preload("res://Objects/Map Maker/Orb/Orb.tscn")

# Orb Parent Node
@export var orbs : Node2D

# Distance to end
var dist = 216.0

# Functions ----------------------------------------------------------------------------------------

func _ready():
	$"..".position.x = get_viewport().size.x / 2
	$"..".position.y = get_viewport().size.y / 2
	
	if orbs != null:
		for i in range(global.mmMap.size()):
			$"..".rotation = global.mmMap[i].angle
			var orbInstance = orb.instantiate()
			orbInstance.distanceToEnd = dist
			orbInstance.distanceToTravel = orbInstance.distanceToEnd
			orbInstance.startOnBeat = global.mmMap[i].start
			orbInstance.endOnBeat = global.mmMap[i].end
			orbInstance.speedToTravel = orbInstance.distanceToTravel / (orbInstance.endOnBeat - orbInstance.startOnBeat)
			orbInstance.look_at(self.position)
			self.add_child(orbInstance)
			orbInstance.reparent(orbs)
