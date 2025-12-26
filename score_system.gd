class_name ScoreBit extends Node

#@export var 

@onready var parent = $"../"
@onready var win_menu = $"../../WinMenu/CanvasLayer"
@onready var game_screen = $"../../"
@onready var ball = $"../../Ball"

#func _ready() -> void:
	#parent.connect("score_achieved", Callable(self, "on_score_achieved"))

var game_paused: bool = false

func on_score_achieved(player_id: int) -> void:
		game_paused = true
		game_screen.stop_game()
		print("WINNING")
		win_menu.visible = true
		match player_id:
			0: 
				$"../../WinMenu/CanvasLayer/BotWin".visible = true
				$"../../WinMenu/BotWin".play()
				print("BOT WINS")
			1:
				$"../../WinMenu/CanvasLayer/PlayerOneWin".visible = true
				$"../../WinMenu/PlayerWin".play()
				print("PLAYER ONE WINS")
			2:
				$"../../WinMenu/CanvasLayer/PlayerTwoWin".visible = true
				$"../../WinMenu/PlayerWin".play()
				print("PLAYER TWO WINS")
			_:
				print("Error, Not found WinMenu")
		ball.visible = false
