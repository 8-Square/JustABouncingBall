class_name S_GameScreen extends Control

@onready var score_block = $Score
@onready var playerOne = $PlayerOne
@onready var bot = $Bot
@onready var ball = $Ball
@onready var pause_menu = $PauseMenu

var game_paused: bool = false

func _ready() -> void:
	pause_menu.connect("resume_pressed", Callable(self, "resume_pressed"))
	playerOne.add_to_group("Moveables")
	bot.add_to_group("Moveables")
	ball.add_to_group("Moveables")


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
	$PauseMenu/CanvasLayer.visible = false

func stop_game():
	for character in get_tree().get_nodes_in_group("Moveables"):
		if "can_control" in character:
			character.can_control = false

func continue_game():
	for character in get_tree().get_nodes_in_group("Moveables"):
		if "can_control" in character:
			character.can_control = true
