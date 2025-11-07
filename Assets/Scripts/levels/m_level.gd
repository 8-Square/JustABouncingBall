extends Control

@onready var score_block = $Score
@onready var playerOne = $PlayerOne
@onready var playerTwo = $PlayerTwo
@onready var ball = $Ball

@export var finish_score: int 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	playerOne.connect("score_achieved", Callable(self, "on_score_achieved"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

func on_score_achieved() -> void:
	if playerOne.score >= finish_score || playerTwo.score >= finish_score:
		playerOne.can_control = false
		playerTwo.can_control = false
		ball.can_move = false
		ball.visible = false
		if playerOne.score >= finish_score:
			print("PLAYER ONE WINS")
		elif playerTwo.score >= finish_score:
			print("PLAYER TWO WINS")
