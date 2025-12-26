class_name PauseMenu extends Control

@onready var music_player = get_tree().current_scene.get_node("Background/BackgroundMusic")
@onready var ui_select: AudioStreamPlayer = $UISelect

func _ready() -> void:
	# Checks for buttons and if it isnt connected to button pressed, then connect it 
	for button in get_tree().get_nodes_in_group("Button"):
		if not button.pressed.is_connected(button_pressed):
			button.pressed.connect(button_pressed)


func button_pressed() -> void:
	ui_select.play()

signal resume_pressed

func _on_resume_pressed():
	emit_signal("resume_pressed")

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
