class_name GameScreen extends Control

@onready var score_block = $Score
@onready var playerOne = $PlayerOne
@onready var playerTwo = $PlayerTwo
@onready var ball = $Ball
@onready var pause_menu = $PauseMenu
@onready var win_menu = $WinMenu

@export var finish_score: MaxScore

var game_paused: bool = false

func _ready() -> void:
	playerOne.connect("score_achieved", Callable(self, "on_score_achieved"))
	playerTwo.connect("score_achieved", Callable(self, "on_score_achieved"))
	pause_menu.connect("resume_pressed", Callable(self, "resume_pressed"))
	playerOne.add_to_group("Moveables")
	playerTwo.add_to_group("Moveables")
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
	movement()
	$PauseMenu/CanvasLayer.visible = false
	game_paused = false

func on_score_achieved() -> void:
	if playerOne.score >= finish_score.FinishScore():
		game_paused = true
		stop_game()
		print("PLAYER ONE WINS")
		$WinMenu/CanvasLayer.visible = true
		$WinMenu/CanvasLayer/PlayerOneWin.visible = true
		ball.visible = false
	
	if playerTwo.score >= finish_score.FinishScore():
		game_paused = true
		stop_game()
		print("PLAYER TWO WINS")
		$WinMenu/CanvasLayer.visible = true
		$WinMenu/CanvasLayer/PlayerTwoWin.visible = true
		ball.visible = false

func stop_game():
	for character in get_tree().get_nodes_in_group("Moveables"):
		if "can_control" in character:
			character.can_control = false

func continue_game():
	for character in get_tree().get_nodes_in_group("Moveables"):
		if "can_control" in character:
			character.can_control = true
