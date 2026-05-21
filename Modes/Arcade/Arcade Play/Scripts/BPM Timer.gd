extends Timer

# Variables ----------------------------------------------------------------------------------------

# Beat Wait Until Start
var startOn = 3

# Functions ----------------------------------------------------------------------------------------

func _on_timeout():
	if global.beat == startOn:
		$"../Music Player".play()
	
	global.beat += 1
	self.start()
