class_name Ball extends CharacterBody2D

@onready var score_block = get_tree().current_scene.get_node("Score/")

@export var player_one : Node2D
@export var player_two : Node2D

var MoreRandom: bool = false
var EvenMoreRandom: bool = false
var SuperRandom: bool = false

var SPEED: float = 350
var collision_count: float = 0 
var can_control: bool = true


func _ready() -> void:
	initialize()

func _physics_process(delta: float) -> void:
	if not can_control:
		return
	
	var collision = move_and_collide(velocity * delta)
		
	if collision:
		var collider = collision.get_collider()
		var bounce_velocity = velocity.bounce(collision.get_normal())
		
		if collider is Player:
			collision_count += 1
			var angle = 13.0
			var bounce_angle = deg_to_rad(randf_range(-angle, angle))
			if not SuperRandom:
				bounce_angle = deg_to_rad(randf_range(-20, 20))
				if not EvenMoreRandom:
					bounce_angle = deg_to_rad(randf_range(-16, 16))
					if not MoreRandom:
						bounce_angle = deg_to_rad(randf_range(-13, 13))
					
			velocity = bounce_velocity.rotated(bounce_angle)
			#print(bounce_angle)
		else:
			collision_count += 1
			#print("COLLISION NUMBER IS ON ", collision_count)
			velocity = velocity.bounce(collision.get_normal())
	
		
	if collision_count >= 45:
		SPEED = 1000
	elif collision_count >= 38:
		SuperRandom = true
		SPEED = 880
	elif collision_count >= 32:
		SPEED = 770
	elif collision_count >= 25:
		EvenMoreRandom = true
		SPEED = 650
	elif collision_count >= 15:
		SPEED = 550
	elif collision_count >= 10:
		MoreRandom = true
		SPEED = 450
	elif collision_count >= 5:
		SPEED = 400
	else:
		SPEED = 350
	
	velocity = velocity.normalized() * SPEED

func initialize():
	var extra_offset = 0.0 if randf() < 0.5 else PI
	var angle = extra_offset + randf_range(-PI/3.0, PI/3)
	
	await get_tree().create_timer(0.5).timeout
	velocity = SPEED * Vector2(cos(angle), sin(angle)).normalized()
	position = get_viewport_rect().size / 2.0

func _on_ball_exited() -> void:
	collision_count = 0
	if is_instance_valid(score_block):
		if !score_block.visible:
			score_block.visible = true
	await get_tree().create_timer(0.75).timeout
	if position.x > 0.0: 
		player_one.score_system()
	else:
		player_two.score_system()
	initialize()
