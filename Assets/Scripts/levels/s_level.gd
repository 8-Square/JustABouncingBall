class_name SLevelScreen extends S_GameScreen

@onready var win_menu = $WinMenu

@export var finish_score: MaxScore


func _ready() -> void:
	pause_menu.connect("resume_pressed", Callable(self, "resume_pressed"))


#func on_score_achieved(player_id: int) -> void:
		#game_paused = true
		#stop_game()
		##print("PLAYER ONE WINS")
		#$WinMenu/CanvasLayer.visible = true
		#match player_id:
			#"0": 
				#$WinMenu/CanvasLayer/PlayerOneWin.visible = true
			#"1":
				#$WinMenu/CanvasLayer/PlayerOneWin.visible = true
			#"2":
				#$WinMenu/CanvasLayer/PlayerTwoWin.visible = true
		#ball.visible = false
