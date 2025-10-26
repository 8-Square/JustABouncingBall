extends CharacterBody2D

@export var player_id: int

const SPEED: float = 400
#
#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed('down-1'):
		#velocity = Vector2(0, SPEED)
	#if event.is_action_pressed('up-%d' % player_id):
		#velocity = Vector2(0, -SPEED)
	#if event.is_action_released('up-%d' % player_id) or event.is_action_released('down-%d' % player_id):
		#velocity = Vector2.ZERO
#
func _process(delta: float) -> void:
	#AHHHHHHHHHH THIS TOOK SO LONG
	if Input.is_action_pressed('down-%d' % player_id):
		velocity = Vector2(0, SPEED)
	if Input.is_action_pressed('up-%d' % player_id):
		velocity = Vector2(0, -SPEED)
	
	if Input.is_action_just_released('up-%d' % player_id) or Input.is_action_just_released('down-%d' % player_id):
		velocity = Vector2.ZERO
	move_and_slide()
