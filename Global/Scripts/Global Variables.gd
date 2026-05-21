extends Node

# Settings
var inputType : String
var useCursor : bool

# Map Variables
var beat = 0
var BPM = 60
var map
var mapTitle
var moveTime

# Map Maker Variables
var mmBeat = 0
var focused = false

var mmTitle
var mmBPM
var mmAudioFile
var mmTrackLengthSec
var mmMapSelect
var mmMoveTime

var tickCount = 100.0

var editing = false

var mmMap = []

# Accuracy
var hitOrbs = 0.0
var missedOrbs = 0.0

# Score
var scoreMult = 1.0
var score = 0
var conscOrbs = 0

func _ready():
	var inputSettings = ConfigFileHandler.load_input_settings()
	inputType = inputSettings.inputMethod
