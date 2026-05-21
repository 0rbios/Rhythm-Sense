extends Area2D

# Variables ----------------------------------------------------------------------------------------

# Base Score
var scoreInc = 10.0

# Functions ----------------------------------------------------------------------------------------

func _on_collision(body: Node2D):
	if body.is_in_group("orb"):
		global.hitOrbs += 1.0
		global.score += int(scoreInc * global.scoreMult)
		if global.conscOrbs == 2:
			global.scoreMult += 0.5
		else:
			global.conscOrbs += 1
		body.get_parent().queue_free()
