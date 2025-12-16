class_name InfinitePlayer extends Player

func score_system():
	score += 1
	#print('SCORE IS ', score)
	score_label.text = '%02d' % score
