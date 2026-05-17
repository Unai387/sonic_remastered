extends Control

func _ready():
	# Si está dentro de un contenedor, añade el nombre del contenedor antes:
	$VBoxContainer/BtnMenu.grab_focus()

func _on_btn_menu_pressed():
	# Cambia la escena a tu menú principal
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")

func _on_btn_salir_pressed():
	# Cierra el juego por completo
	get_tree().quit()
