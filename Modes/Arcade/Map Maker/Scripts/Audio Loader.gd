extends AudioStreamPlayer2D

func _ready():
	if global.mmAudioFile != null:
		self.stream = global.mmAudioFile
