class_name LevelBall extends Ball

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
