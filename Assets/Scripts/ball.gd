class_name Ball extends CharacterBody2D

@onready var score_block = get_tree().current_scene.get_node("Score/")

@export var player_one : Node2D
@export var player_two : Node2D

@export var player_contact: int
@export var wall_contact: int

var MoreRandom: bool = false
var EvenMoreRandom: bool = false
var SuperRandom: bool = false

var SPEED: float = 350
const starting_speed: float = 350

const max_bounceback: float = 0.6
var direction: Vector2

var collision_count: float = 0 
var can_control: bool = true


func _ready() -> void:
	initialize()

func initialize():
	SPEED = starting_speed
	var extra_offset = 0.0 if randf() < 0.5 else PI
	var angle = extra_offset + randf_range(-PI/3.5, PI/3.5)
	
	await get_tree().create_timer(0.5).timeout
	velocity = SPEED * Vector2(cos(angle), sin(angle)).normalized()
	position = get_viewport_rect().size / 2.0

func _physics_process(delta: float) -> void:
	if not can_control:
		return
	
	var collision = move_and_collide(velocity * delta)
		
	if collision:
		var collider = collision.get_collider()
		var normal = collision.get_normal()
		
		if collider is Player:
			collision_count += 1
			SPEED += player_contact
			if abs(normal.x) > abs(normal.y):
				velocity = random_bounceback(collider)
			else:
				velocity = velocity.bounce(normal)
		else:
			collision_count += 1
			SPEED += wall_contact
			print(SPEED)
			print("COLLISION NUMBER IS ON ", collision_count)
			velocity = velocity.bounce(normal)
	
	velocity = velocity.normalized() * SPEED

func random_bounceback(collider):
	var ball_y = global_position.y
	var player_y = collider.global_position.y
	var distance = ball_y - player_y
	var bounceback := Vector2()
	var shape := collider.get_node("CollisionShape2D").shape as RectangleShape2D
	var height = shape.size.y
	
	bounceback.x = -sign(velocity.x)
	#if direction.x > 0:
		#bounceback.x = -1
	#else:
		#bounceback.x = 1
	bounceback.y = (distance / (height / 2)) * max_bounceback
	bounceback.y = clamp(bounceback.y, -0.85, 0.85)
	return bounceback.normalized()

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
