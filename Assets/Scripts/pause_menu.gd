extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_resume_pressed() -> void:
	pass # Replace with function body.


func _on_restart_pressed() -> void:
	await get_tree().create_timer(0.3).timeout
	$CanvasLayer/Fade.show()
	$AnimationPlayer.play("fade_in")
	await $AnimationPlayer.animation_finished
	get_tree().reload_current_scene()

func _on_main_menu_pressed() -> void:
	await get_tree().create_timer(0.3).timeout
	$CanvasLayer/Fade.show()
	$AnimationPlayer.play("fade_in")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file("res://Assets/Scenes/MainMenu.tscn")
