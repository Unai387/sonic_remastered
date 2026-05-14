extends Area2D

@export_file("*.tscn") var proxima_escena: String = "res://scenes/levels/batalla_boss.tscn"

func _ready():
	if not body_entered.is_connected(_on_body_entered):
		body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Sonic" or body.is_in_group("player"):
		# Usamos call_deferred para cambiar de escena de forma segura
		get_tree().call_deferred("change_scene_to_file", proxima_escena)
