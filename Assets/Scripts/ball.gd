extends CharacterBody2D

const SPEED: float = 400

func _ready() -> void:
	initialize()

func _physics_process(delta: float) -> void:
	move_and_slide()
	
func initialize():
	var extra_offset = 0.0 if randf() < 0.5 else PI
	var angle = extra_offset + randf_range(-PI/3.0, PI/3)
	velocity = SPEED * Vector2(cos(angle), sin(angle)).normalized()
	position = get_viewport_rect().size / 2.0


func _on_ball_exited() -> void:
	await get_tree().create_timer(0.75).timeout
	initialize()
