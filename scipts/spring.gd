extends Area2D

@export var bounce_force = -700.0

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Sonic":
		body.velocity.y = bounce_force
		if body.has_method("update_animation"):
			body.anim.play("saltar") # Forzamos animación de salto
		
		# Si el resorte tiene animaciones:
		if has_node("AnimatedSprite2D"):
			$AnimatedSprite2D.play("bounce")
