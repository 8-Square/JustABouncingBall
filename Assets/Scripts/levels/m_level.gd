class_name MLevelScreen extends GameScreen

@onready var win_menu = $WinMenu

@export var finish_score: MaxScore


func _ready() -> void:
	playerOne.connect("score_achieved", Callable(self, "on_score_achieved"))
	playerTwo.connect("score_achieved", Callable(self, "on_score_achieved"))
	pause_menu.connect("resume_pressed", Callable(self, "resume_pressed"))
	playerOne.add_to_group("Moveables")
	playerTwo.add_to_group("Moveables")
	ball.add_to_group("Moveables")


func on_score_achieved(player_id: int) -> void:
		game_paused = true
		stop_game()
		print("PLAYER ONE WINS")
		$WinMenu/CanvasLayer.visible = true
		if player_id == 1:
			$WinMenu/CanvasLayer/PlayerOneWin.visible = true
		elif player_id == 2:
			$WinMenu/CanvasLayer/PlayerTwoWin.visible = true
		ball.visible = false
