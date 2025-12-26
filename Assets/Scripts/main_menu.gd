extends Control

@onready var s_difficulty_select: Control = $SingleplayerScreen/DifficultySelect
@onready var s_game_type_select: Control = $SingleplayerScreen/GameTypeSelect
@onready var back_singleplayer: Button = $SingleplayerScreen/DifficultySelect/Back
@onready var back_singleplayer_2: Button = $SingleplayerScreen/GameTypeSelect/Back
@onready var ui_select: AudioStreamPlayer = $UISelect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MainMenuScreen.show()
	$SingleplayerScreen.hide()
	$MultiplayerScreen.hide()
	$SettingScreen.hide()
	s_difficulty_select.show()
	s_game_type_select.hide()
	back_singleplayer.show()
	
	# Checks for buttons and if it isnt connected to button pressed, then connect it 
	for button in get_tree().get_nodes_in_group("Button"):
		if not button.pressed.is_connected(button_pressed):
			button.pressed.connect(button_pressed)


func button_pressed() -> void:
	ui_select.play()

func _on_singleplayer_pressed() -> void:
	$MainMenuScreen.hide()
	$SingleplayerScreen.show()
	s_difficulty_select.show()

func _on_multiplayer_pressed() -> void:
	$MainMenuScreen.hide()
	$MultiplayerScreen.show()

func _on_settings_pressed() -> void:
	$MainMenuScreen.hide()
	$SettingScreen.show()

func _on_quit_pressed() -> void:
	await get_tree().create_timer(0.4).timeout
	get_tree().quit()

# Back button 
func _on_back_pressed() -> void:
	$SingleplayerScreen.hide()
	$MultiplayerScreen.hide()
	$SettingScreen.hide()
	$MainMenuScreen.show()
	s_game_type_select.hide()

# Difficulty on Singleplayer Screen
func _on_difficulty_selected(Difficulty: String) -> void:
	GlobalDifficulty.bot_difficulty = Difficulty
	
	print(GlobalDifficulty.bot_difficulty)
	back_singleplayer_2.show()
	back_singleplayer.hide()
	s_difficulty_select.hide()
	s_game_type_select.show()

# Back Button specific to Singleplayer Screen
func _on_gametype_back_pressed() -> void:
	s_difficulty_select.show()
	s_game_type_select.hide()
	back_singleplayer.show()
	back_singleplayer_2.hide()


# MULTIPLAYER ROUNDS
func _m_on_inf_round_pressed() -> void:
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://Assets/Scenes/Gameplay/Multiplayer/MInf.tscn")
func _on_M_three_round_pressed() -> void:
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://Assets/Scenes/Gameplay/Multiplayer/MThree.tscn")
func _on_M_five_round_pressed() -> void:
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://Assets/Scenes/Gameplay/Multiplayer/MFive.tscn")
func _on_M_ten_round_pressed() -> void:
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://Assets/Scenes/Gameplay/Multiplayer/MTen.tscn")

# SINGLEPLAYER ROUNDS
func _on_S_inf_round_pressed() -> void:
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://Assets/Scenes/Gameplay/Singleplayer/SInf.tscn")
func _on_S_three_round_pressed() -> void:
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://Assets/Scenes/Gameplay/Singleplayer/SThree.tscn")
func _on_S_five_round_pressed() -> void:
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://Assets/Scenes/Gameplay/Singleplayer/SFive.tscn")
func _on_S_ten_round_pressed() -> void:
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://Assets/Scenes/Gameplay/Singleplayer/STentscn")
