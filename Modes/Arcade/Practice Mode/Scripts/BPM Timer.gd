extends Timer

func _on_timeout():
	global.beat += 1
	self.start()
