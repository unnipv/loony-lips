extends Control


func _ready():
	var prompts = ["Little Hangleton","the Riddle House","Riddle family"]
	var story = "The villagers of %s still called it ‘%s', even though it had been many years since the %s had lived there."
	$VBoxContainer/DisplayText.text = story % prompts

	
func _on_InputText_text_entered(new_text):
	update_DisplayText(new_text)

func update_DisplayText(new_text):
	$VBoxContainer/DisplayText.text = new_text
	$VBoxContainer/InputText.clear()
