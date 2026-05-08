extends Area2D

# Esta variable te permite elegir la escena desde el Inspector
@export_file("*.tscn") var escena_destino: String

func _on_body_entered(body):
	# Verificamos que sea Sonic quien toca el portal
	if body.name == "Sonic" or body.name == "sonic":
		if escena_destino == "":
			print("¡Error! No has asignado la escena del Boss en el Inspector")
		else:
			print("Teletransportando a la batalla...")
			get_tree().change_scene_to_file(escena_destino)
