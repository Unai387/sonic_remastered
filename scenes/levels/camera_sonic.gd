extends Camera2D

var shake_strength: float = 0.0
var shake_decay: float = 20.0 

@export var target_path: NodePath
var target: Node2D

func _ready():
	await get_tree().process_frame
	target = get_node_or_null(target_path) if target_path else get_tree().current_scene.find_child("Sonic", true, false)

	var muro = get_tree().current_scene.find_child("LimiteCamara", true, false)
	if muro:
		var poligono = muro.find_child("CollisionPolygon2D", true, false)
		if poligono and poligono.polygon.size() > 0:
			var p = poligono.polygon
			var min_v = p[0]
			var max_v = p[0]
			for v in p:
				min_v.x = min(min_v.x, v.x); min_v.y = min(min_v.y, v.y)
				max_v.x = max(max_v.x, v.x); max_v.y = max(max_v.y, v.y)
			limit_left = int(min_v.x + muro.global_position.x)
			limit_right = int(max_v.x + muro.global_position.x)
			limit_top = int(min_v.y + muro.global_position.y)
			limit_bottom = int(max_v.y + muro.global_position.y)

func _process(delta):
	if get_tree().current_scene.name == "batalla_boss.tscn":
		global_position = Vector2((limit_left + limit_right) / 2, (limit_top + limit_bottom) / 2)
	elif target:
		global_position = lerp(global_position, target.global_position, 0.1)

	if shake_strength > 0:
		offset = Vector2(randf_range(-shake_strength, shake_strength), randf_range(-shake_strength, shake_strength))
		shake_strength = move_toward(shake_strength, 0, shake_decay * delta)
	else:
		offset = Vector2.ZERO

func apply_shake(intensity: float):
	shake_strength = intensity
