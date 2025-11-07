extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MainMenuScreen.show()
	$SingleplayerScreen.hide()
	$MultiplayerScreen.hide()
	$SettingScreen.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_singleplayer_pressed() -> void:
	$MainMenuScreen.hide()
	$SingleplayerScreen.show()

func _on_multiplayer_pressed() -> void:
	$MainMenuScreen.hide()
	$MultiplayerScreen.show()
	


func _on_settings_pressed() -> void:
	$MainMenuScreen.hide()
	$SettingScreen.show()

func _on_quit_pressed() -> void:
	await get_tree().create_timer(0.4).timeout
	get_tree().quit()


func _on_back_pressed() -> void:
	$SingleplayerScreen.hide()
	$MultiplayerScreen.hide()
	$SettingScreen.hide()
	$MainMenuScreen.show()


func _m_on_inf_round_pressed() -> void:
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://Assets/Scenes/MInf.tscn")


func _on_M_three_round_pressed() -> void:
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://Assets/Scenes/MThree.tscn")
