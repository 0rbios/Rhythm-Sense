extends Label

func _process(_delta):
	if global.hitOrbs + global.missedOrbs == 0:
		$".".text = "100%"
	else:
		var accuracy = int(global.hitOrbs / (global.hitOrbs + global.missedOrbs) * 100)
		$".".text = str(accuracy) + "%"
