extends Button

# Variables ----------------------------------------------------------------------------------------

# Nodes
@onready var timeline = $"../Hide While Playing/Timeline"
@onready var audioPlayer = $"../Audio File Player"
@onready var timer = $"../Beat Timer"
@onready var hideables = $"../Hide While Playing"

var hover = false

# Functions ----------------------------------------------------------------------------------------

func _on_pressed():
	hideables.visible = false
	timer.wait_time = 1.0 / (float(global.mmBPM) / 60.0)
	timer.start()
	audioPlayer.play()

func beat_timer_out():
	global.mmBeat += 1
	timer.start()

func _audio_out():
	timer.stop()
	hideables.visible = true

func _hover_over(area: Area2D):
	hover = true

func _hover_off(area: Area2D):
	hover = false

func _physics_process(_delta):
	if Input.is_action_just_pressed("Accept") and hover == true:
		_on_pressed()
