extends Area2D

# Amb '@export' pots arrossegar l'escena directament des de l'inspector de Godot
@export_file("*.tscn") var proxima_escena: String = "res://scenes/levels/batalla_boss.tscn"

func _ready() -> void:
	# Ens assegurem que el senyal està connectat per codi (més segur)
	if not body_entered.is_connected(_on_body_entered):
		body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	# Comprovació triple per seguretat:
	# 1. Mira si el body té un mètode que només té el Player
	# 2. Mira si el body es diu "Player"
	# 3. Mira si està al grup "player"
	if body.name == "Player" or body.is_in_group("player") or body.has_method("get_input"):
		print("Portal activat! Carregant: ", proxima_escena)
		
		# Canvi d'escena amb gestió d'errors
		var error = get_tree().change_scene_to_file(proxima_escena)
		
		if error != OK:
			print("ERROR: No s'ha pogut carregar l'escena. Revisa la ruta!")
