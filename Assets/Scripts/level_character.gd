class_name LevelPlayer extends Player

@export var max_score: MaxScore
signal score_achieved(player_id)

func score_system():
	score += 1
	#print('SCORE IS ', score)
	score_label.text = '%02d' % score
	if score >= max_score.FinishScore():
		#print("03 ACHEIVED")
		score_achieved.emit(player_id)
		print(player_id)
