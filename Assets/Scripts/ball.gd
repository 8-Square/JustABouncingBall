extends CharacterBody2D

var SPEED: float = 350
var collision_count: float = 0 

func _ready() -> void:
	initialize()

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		collision_count += 1
		print("COLLISION NUMBER IS ON ", collision_count)
		velocity = velocity.bounce(collision.get_normal())
		
	if collision_count >= 32:
		SPEED = 770
	if collision_count >= 25:
		SPEED = 650
	elif collision_count >= 17:
		SPEED = 550
	elif collision_count >= 10:
		SPEED = 450
	else:
		SPEED = 350
	
	velocity = velocity.normalized() * SPEED

	
func initialize():
	var extra_offset = 0.0 if randf() < 0.5 else PI
	var angle = extra_offset + randf_range(-PI/3.0, PI/3)
	velocity = SPEED * Vector2(cos(angle), sin(angle)).normalized()
	position = get_viewport_rect().size / 2.0


func _on_ball_exited() -> void:
	await get_tree().create_timer(0.75).timeout
	collision_count = 0
	initialize()
