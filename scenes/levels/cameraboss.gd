extends Camera2D

func _ready():
	var zona = get_tree().current_scene.find_child("LimiteCamara", true, false)
	if zona:
		var poligono = zona.find_child("CollisionPolygon2D", true, false)
		if poligono and poligono.polygon.size() > 0:
			var rect = Rect2(poligono.polygon[0], Vector2.ZERO)
			for p in poligono.polygon: rect = rect.expand(p)
			
			var centro_arena = rect.get_center() + zona.global_position
			global_position = centro_arena
			
			limit_left = int(rect.position.x + zona.global_position.x)
			limit_right = int(rect.end.x + zona.global_position.x)
			limit_top = int(rect.position.y + zona.global_position.y)
			limit_bottom = int(rect.end.y + zona.global_position.y)
			
			set_process(false)
