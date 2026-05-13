extends Camera2D

func _ready():
	# 1. Buscamos el área que dibujaste
	var zona = get_tree().current_scene.find_child("LimiteCamara", true, false)
	
	if zona:
		var poligono = zona.find_child("CollisionPolygon2D", true, false)
		if poligono:
			var puntos = poligono.polygon
			if puntos.size() > 0:
				var rect = Rect2(puntos[0], Vector2.ZERO)
				for p in puntos:
					rect = rect.expand(p)
				
				# 2. Posicionar la cámara justo en el centro del rectángulo
				var centro_arena = rect.get_center() + zona.global_position
				global_position = centro_arena
				
				# 3. Forzar límites para que no se vea NADA de fuera
				limit_left = int(rect.position.x + zona.global_position.x)
				limit_right = int(rect.end.x + zona.global_position.x)
				limit_top = int(rect.position.y + zona.global_position.y)
				limit_bottom = int(rect.end.y + zona.global_position.y)
				
				# 4. Asegurar que la cámara no se mueva
				set_process(false) 
				print("Cámara fijada en el centro de la arena.")
