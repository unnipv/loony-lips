extends Control


func _ready():
	var prompts = ["Little Hangleton","the Riddle House","Riddle family"]
	var story = "The villagers of %s still called it ‘%s', even though it had been many years since the %s had lived there."
	print(story % prompts)
