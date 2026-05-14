extends Control

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$VBoxContainer/BtnContinuar.pressed.connect(_on_continuar_pressed)
	$VBoxContainer/BtnSalir.pressed.connect(_on_salir_pressed)

func _on_continuar_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level_2.tscn")

func _on_salir_pressed():
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")
