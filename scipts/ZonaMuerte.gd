extends Area2D

func _on_body_entered(body: Node2D) -> void:
	# Comprobamos si lo que ha caído es el personaje
	if body.name == "Sonic" or body.is_in_group("player"):
		
		# Cambia la escena a la pantalla de "Has Muerto"
		# REEMPLAZA "res://Escenas/HasMuerto.tscn" por la ruta real de tu escena
		get_tree().change_scene_to_file("res://scenes/ui/GameOver.tscn")
