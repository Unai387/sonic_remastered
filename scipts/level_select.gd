extends Control

func _ready():
	$ButtonContainer/Level1Button.pressed.connect(func(): _load_level(1))
	$ButtonContainer/Level2Button.pressed.connect(func(): _load_level(2))
	$ButtonContainer/BackButton.pressed.connect(_on_back_pressed)

func _load_level(num):
	GameManager.reset_game()
	get_tree().change_scene_to_file("res://scenes/levels/level_" + str(num) + ".tscn")

func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")
