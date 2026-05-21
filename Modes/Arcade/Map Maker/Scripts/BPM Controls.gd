extends TextEdit

# Variables ----------------------------------------------------------------------------------------

var BPM = 100

var upHover = false
var downHover = false

# Functions ----------------------------------------------------------------------------------------

func bpm_down():
	BPM -= 1
	self.text = str(BPM)
	
func bpm_up():
	BPM += 1
	self.text = str(BPM)
	
func _on_hitbox_area_entered(area: Area2D):
	upHover = true

func _bpm_up_hover_off(area: Area2D):
	upHover = false

func _bpm_down_hover_over(area: Area2D):
	downHover = true
	
func _bpm_down_hover_off(area: Area2D):
	downHover = false

func _physics_process(_delta):
	if Input.is_action_just_pressed("Accept"):
		if upHover == true:
			bpm_up()
		elif downHover == true:
			bpm_down()
