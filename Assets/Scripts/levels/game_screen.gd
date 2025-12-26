class_name GameScreen extends Control

@export var pause_menu: Control

@onready var background: Background = $Background

var game_paused: bool = false
var music_position = 0.0
var music_playing = false

func _ready() -> void:
	pause_menu.connect("resume_pressed", Callable(self, "resume_pressed"))

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("cancel") and game_paused == false:
		game_paused = true
		movement()
	elif Input.is_action_just_pressed("cancel") and game_paused == true:
		print("WORKIUIGFNBDSUFN")
		game_paused = false
		movement()

func movement() -> void:
	if game_paused == true:
		stop_game()
		$PauseMenu/CanvasLayer.visible = true
	elif game_paused == false:
		continue_game()
		$PauseMenu/CanvasLayer.visible = false

func resume_pressed():
	game_paused = false
	movement()

func stop_game():
	background.stop_music()
	for character in get_tree().get_nodes_in_group("Moveables"):
		if "can_control" in character:
			character.can_control = false

func continue_game():
	background.play_music()
	for character in get_tree().get_nodes_in_group("Moveables"):
		if "can_control" in character:
			character.can_control = true
