class_name GameScreen extends Control

@onready var score_block = $Score
@onready var playerOne = $PlayerOne
@onready var playerTwo = $PlayerTwo
@onready var ball = $Ball
@onready var pause_menu = $PauseMenu

@export var finish_score: int 

var game_paused: bool = false

func _ready() -> void:
	playerOne.connect("score_achieved", Callable(self, "on_score_achieved"))
	playerOne.add_to_group("Moveables")
	playerTwo.add_to_group("Moveables")
	ball.add_to_group("Moveables")
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
		for character in get_tree().get_nodes_in_group("Moveables"):
			if "can_control" in character:
				character.can_control = false
		$PauseMenu/CanvasLayer.visible = true
	elif game_paused == false:
		for character in get_tree().get_nodes_in_group("Moveables"):
			if "can_control" in character:
				character.can_control = true
		$PauseMenu/CanvasLayer.visible = false

func resume_pressed():
	for character in get_tree().get_nodes_in_group("Moveables"):
		if "can_control" in character:
			character.can_control = true
	$PauseMenu/CanvasLayer.visible = false
	game_paused = false

func on_score_achieved() -> void:
	if playerOne.score >= finish_score || playerTwo.score >= finish_score:
		playerOne.can_control = false
		playerTwo.can_control = false
		ball.can_control = false
		ball.visible = false
		if playerOne.score >= finish_score:
			print("PLAYER ONE WINS")
		elif playerTwo.score >= finish_score:
			print("PLAYER TWO WINS")
