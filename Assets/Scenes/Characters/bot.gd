class_name Bot extends Paddle
# Player id will be 0 as in this case this will be 0 as bot isnt a player

@export var ball: CharacterBody2D

var ball_position: Vector2
var distance: float
var move_by: float

var bot_speed: float
var reaction_time: float
var offset := 0.0
var target_y := 0.0


func _ready() -> void:
	print(GlobalDifficulty.bot_difficulty)
	match GlobalDifficulty.bot_difficulty:
		"easy": 
			offset = randf_range(-20, 20)
			bot_speed = SPEED * 0.6
			reaction_time = 0.3
		"medium": 
			offset = randf_range(-8, 8)
			bot_speed = SPEED * 0.9
			reaction_time = 0.15
		"hard": 
			offset = 0
			bot_speed = SPEED * 1.1
			reaction_time = 0.00
		null: 
			print("ERROR OCCURED WITH BOT DIFFICULTY ON BOT SCRIPT")
	
	target_y = global_position.y


func _process(delta: float) -> void:
	if not can_control:
		return
	
	ball_position = ball.global_position
	
	reaction_time -= delta
	if reaction_time <= 0:
		match GlobalDifficulty.bot_difficulty:
			"easy": 
				target_y = ball_position.y + randf_range(-30, 30)
				reaction_time = 0.3
			"medium": 
				target_y = ball_position.y + randf_range(-15, 15)
				reaction_time = 0.15
			"hard": 
				target_y = ball_position.y + randf_range(-2, 2)
				reaction_time = 0.02
		
	distance = target_y - global_position.y
	var dead_zone = 6
	
	if abs(distance) > dead_zone:
		move_by = clamp(distance, -bot_speed * delta, bot_speed * delta)
	else:
		move_by = distance
	
	position.y += move_by
	
	move_and_slide()
