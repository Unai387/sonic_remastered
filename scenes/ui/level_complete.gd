extends Control

func _ready():
	# Hacemos que el ratón sea visible para poder clicar
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	# Conectamos las señales de los botones
	$VBoxContainer/BtnContinuar.pressed.connect(_on_continuar_pressed)
	$VBoxContainer/BtnSalir.pressed.connect(_on_salir_pressed)

func _on_continuar_pressed():
	# Cambia "res://Level2.tscn" por la ruta de tu siguiente nivel
	get_tree().change_scene_to_file("res://scenes/levels/level_2.tscn")

func _on_salir_pressed():
	# Esto cierra el juego. Si quieres ir al menú, cambia esto por change_scene_to_file
		get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")
