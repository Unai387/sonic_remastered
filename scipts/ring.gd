extends Area2D

var soltado = false
var velocidad = Vector2.ZERO
var tiempo_espera = 0.5

func _ready():
	body_entered.connect(_on_body_entered)
	var anim = get_node_or_null("AnimatedSprite2D")
	if not anim: anim = get_node_or_null("AnimatedSprite")
	if anim: anim.play()

func _physics_process(delta):
	if soltado:
		position += velocidad * delta
		velocidad.y += 15
		velocidad *= 0.98
		tiempo_espera -= delta

func _on_body_entered(body):
	if soltado and tiempo_espera > 0: return
	if body.name == "Sonic" or body.has_method("collect_ring"):
		body.collect_ring()
		queue_free()
