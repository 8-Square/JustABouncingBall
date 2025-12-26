class_name Background extends Node2D

# BACKGROUND MUSIC GOES FROM 13.60 - 132.20
# STARTING MUSIC MUSIC GOES FROM 00.00 - 132.20
@onready var background_music: AudioStreamPlayer = $BackgroundMusic
@onready var starting_background_music: AudioStreamPlayer = $StartingBackgroundMusic

# STARTING MUSIC MUSIC GOES FROM 00.00 - 128.9
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await starting_background_music.finished
	background_music.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
