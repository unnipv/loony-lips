extends Control

var player_words = []
var prompts = ["name of village","name of building","name of family"]
var story = "The villagers of %s still called it ‘%s', even though it had been many years since the %s had lived there."

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText

func _ready():
	DisplayText.text = "Welcome to Loony Lips!\n"
	check_player_words_size()
	PlayerText.grab_focus()

func _on_InputText_text_entered(_new_text):
	add_to_player_words()

func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		add_to_player_words()

func add_to_player_words():
	player_words.append(PlayerText.text)
	DisplayText.text = ""
	PlayerText.clear()
	check_player_words_size()

func is_story_done():
	return player_words.size() == prompts.size()

func check_player_words_size():
	if is_story_done():
		end_game()
	else:
		prompt_player()

func play_story():
	DisplayText.text = story % player_words

func prompt_player():
	DisplayText.text += "Please enter " + prompts[player_words.size()]

func end_game():
	PlayerText.queue_free()
	play_story()
	$VBoxContainer/HBoxContainer/ButtonLabel.text = "Go again"
