class_name Paddle extends CharacterBody2D

@export var player_id: int
@export var score_label: Label
@export var max_score: MaxScore
@onready var score_bit = $"ScoreSystem"


var SPEED: float = 400
var score: int = 0
var can_control: bool = true



func score_system():
	score += 1
	score_label.text = '%02d' % score
	
	if max_score != null and score >= max_score.FinishScore():
		if score_bit != null:
			score_bit.on_score_achieved(player_id)
