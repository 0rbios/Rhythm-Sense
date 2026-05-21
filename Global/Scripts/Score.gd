extends Label

func _physics_process(_delta):
	self.text = str(global.scoreMult) + "x"
	$"../Score".text = str(global.score)
