class_name Background extends Node2D

# BACKGROUND MUSIC GOES FROM 13.60 - 128.9
# STARTING MUSIC MUSIC GOES FROM 00.00 - 128.9
@onready var background_music: AudioStreamPlayer = $BackgroundMusic
@onready var starting_background_music: AudioStreamPlayer = $StartingBackgroundMusic

@export var musicplayers: Array[AudioStreamPlayer] 

var music_position = 0.0
var music_playing: AudioStreamPlayer

func _ready() -> void:
	music_playing = starting_background_music
	await starting_background_music.finished
	# playing name will be set to background music once starting music finishes
	music_playing = background_music
	background_music.play()

func _process(delta: float) -> void:
	pass
	
func stop_music() -> void:
	music_position = music_playing.get_playback_position()
	music_playing.stop()

func play_music() -> void:
	music_playing.play(music_position)
