class_name Bot extends Paddle
# Player id will be 0 as in this case this will be 0 as bot isnt a player

@export var ball: CharacterBody2D

var ball_position: Vector2
var distance: int
var move_by: int

var reaction_time: int

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if not can_control:
		return
	
	ball_position = ball.global_position
	distance = global_position.y - ball_position.y
	
	if abs(distance) > SPEED * delta:
		move_by = SPEED * delta * (distance / abs(distance))
	else:
		move_by = distance
	position.y -= move_by

	move_and_slide()
