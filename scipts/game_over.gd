extends CanvasLayer

func _ready():
	$Container/RestartButton.pressed.connect(_on_restart_pressed)
	$Container/ExitButton.pressed.connect(_on_exit_pressed)

func _on_restart_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")
	queue_free()

func _on_exit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")
	queue_free()
