class_name Bot extends CharacterBody2D

@export var player_id: int
# in this case this will be 0 as bot isnt a player
@export var max_score: Node
@export var ball: CharacterBody2D
@export var score_label: Label

var ball_position: Vector2
var distance: int
var move_by: int
var SPEED: float = 400

var score: int = 0
var can_control: bool = true

signal score_achieved(player_id)

func _process(delta: float) -> void:
	if not can_control:
		return
	
	ball_position = ball.global_position
	distance = global_position.y - ball_position.y
	
	move_by = SPEED * delta * sign(distance)
	position.y -= move_by
	
	
	move_and_slide()

func score_system():
	score += 1
	score_label.text = '%02d' % score
	if score >= max_score.FinishScore():
		#print("03 ACHEIVED")
		score_achieved.emit(player_id)
		print(player_id)
