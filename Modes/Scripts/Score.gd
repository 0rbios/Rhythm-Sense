extends Label

func _process(_delta) -> void:
	self.text = str(global.scoreMult) + "x"
	$"../Score".text = str(global.score)
