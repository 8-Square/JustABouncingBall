extends CharacterBody2D

@export var player_id: int
@export var score_label: Label

var SPEED: float = 400
var score: int = 0

func _process(delta: float) -> void:
	#AHHHHHHHHHH THIS TOOK SO LONG
	if Input.is_action_pressed('down-%d' % player_id):
		velocity = Vector2(0, SPEED)
	if Input.is_action_pressed('up-%d' % player_id):
		velocity = Vector2(0, -SPEED)
	
	if Input.is_action_just_released('up-%d' % player_id) or Input.is_action_just_released('down-%d' % player_id):
		velocity = Vector2.ZERO
	move_and_slide()

func score_system():
	score += 1
	score_label.text = '%02d' % score
