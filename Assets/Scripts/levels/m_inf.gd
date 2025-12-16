class_name M_InfiniteScreen extends GameScreen

func _ready() -> void:
	pause_menu.connect("resume_pressed", Callable(self, "resume_pressed"))
	playerOne.add_to_group("Moveables")
	playerTwo.add_to_group("Moveables")
	ball.add_to_group("Moveables")
