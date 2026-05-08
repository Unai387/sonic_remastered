extends Camera2D

# --- VARIABLES DE SHAKE (Temblor) ---
var shake_strength: float = 0.0
var shake_decay: float = 20.0 

# --- VARIABLES DE SEGUIMIENTO ---
@export var target_path: NodePath
var target: Node2D

func _ready():
	# 1. Esperamos un frame para que el nivel cargue bien
	await get_tree().process_frame
	
	# 2. Buscamos a Sonic
	if target_path:
		target = get_node(target_path)
	else:
		target = get_tree().current_scene.find_child("Sonic", true, false)

	# 3. CONFIGURAR LÍMITES POR POLÍGONO
	# Buscamos el Area2D que llamaste "LimiteCamara"
	var muro = get_tree().current_scene.find_child("LimiteCamara", true, false)
	
	if muro:
		var poligono = muro.find_child("CollisionPolygon2D", true, false)
		if poligono:
			var puntos = poligono.polygon
			if puntos.size() > 0:
				# Calculamos los extremos del dibujo que hiciste
				var min_x = puntos[0].x
				var max_x = puntos[0].x
				var min_y = puntos[0].y
				var max_y = puntos[0].y
				
				for p in puntos:
					if p.x < min_x: min_x = p.x
					if p.x > max_x: max_x = p.x
					if p.y < min_y: min_y = p.y
					if p.y > max_y: max_y = p.y
				
				# Aplicamos los límites finales a la cámara
				limit_left = min_x + muro.global_position.x
				limit_right = max_x + muro.global_position.x
				limit_top = min_y + muro.global_position.y
				limit_bottom = max_y + muro.global_position.y
				print("Cámara bloqueada por polígono correctamente")

func _process(delta):
	# 1. SEGUIMIENTO SUAVE
	if target:
		# El valor 0.1 es la suavidad; si quieres que sea más rápida, sube a 0.2
		global_position = lerp(global_position, target.global_position, 0.1)

	# 2. LÓGICA DEL TEMBLOR
	if shake_strength > 0:
		offset = Vector2(
			randf_range(-shake_strength, shake_strength),
			randf_range(-shake_strength, shake_strength)
		)
		shake_strength = move_toward(shake_strength, 0, shake_decay * delta)
	else:
		offset = Vector2.ZERO

# Función para llamar cuando Sonic recibe daño o hay una explosión
func apply_shake(intensity: float):
	shake_strength = intensity
