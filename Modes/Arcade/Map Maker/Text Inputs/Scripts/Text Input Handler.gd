extends ColorRect

@export var inputDisplay : Label

var validCharacters : Array[String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "1", "2", "3", "4", "4", "5", "6", "7", "8", "9", "0"]
var inputText : String = ""
var blinkerPosition : int = inputText.length()
var blinker : String = ""
var focused : bool = false

func _input(event: InputEvent) -> void:
	if !focused: return
	
	if event.is_pressed():
		inputText = inputText.remove_chars(blinker)
		
		if event.as_text() == "Left":
			if blinkerPosition > 0:
				blinkerPosition -= 1
		elif event.as_text() == "Right":
			if blinkerPosition < inputText.length():
				blinkerPosition += 1
		
		if validCharacters.has(event.as_text()):
			inputText = inputText.insert(blinkerPosition, event.as_text().to_lower())
			blinkerPosition += 1
		elif validCharacters.has(event.as_text().remove_chars("Shift+")):
			if event.as_text().remove_chars("Shift+") == "9":
				inputText = inputText.insert(blinkerPosition, "(")
				blinkerPosition += 1
			elif event.as_text().remove_chars("Shift+") == "0":
				inputText = inputText.insert(blinkerPosition, ")")
				blinkerPosition += 1
			else:
				inputText = inputText.insert(blinkerPosition, event.as_text().remove_chars("Shift+"))
				blinkerPosition += 1
		elif event.as_text() == "Space":
			inputText = inputText.insert(blinkerPosition, " ")
			blinkerPosition += 1
		elif event.as_text() == "Backspace":
			inputText = inputText.substr(0, blinkerPosition - 1) + inputText.substr(blinkerPosition)
			blinkerPosition -= 1
		
		inputText = inputText.insert(blinkerPosition, blinker)
		inputDisplay.text = inputText

func focusEntered() -> void:
	blinker = "|"
	inputText = inputText.insert(blinkerPosition, blinker)
	inputDisplay.text = inputText
	focused = true

func focusExited() -> void:
	inputText = inputText.remove_chars(blinker)
	blinker = ""
	inputDisplay.text = inputText
	focused = false
