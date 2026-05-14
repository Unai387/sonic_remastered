extends CharacterBody2D

const ACCELERATION = 1200.0
const DECELERATION = 800.0
const MAX_SPEED = 400.0
const FRICTION = 600.0
const JUMP_VELOCITY = -500.0
const GRAVITY = 1200.0
const MAX_FALL_SPEED = 800.0
const WALL_JUMP_VELOCITY = Vector2(400, -500)
const WALL_SLIDE_SPEED = 100.0
const COYOTE_DURATION = 0.15 

@onready var RingScene = preload("res://scenes/objects/ring.tscn")
@onready var anim = $sonic_animations

@export var vidas: int = 3
var coyote_timer = 0.0
var esta_invulnerable = false
var speed = 0.0
var rings = 0
var is_on_wall_slide = false

func _ready():
	if GameManager: GameManager.lives = vidas

func _physics_process(delta):
	coyote_timer = COYOTE_DURATION if is_on_floor() else coyote_timer - delta

	if not is_on_floor():
		velocity.y = min(velocity.y + GRAVITY * delta, MAX_FALL_SPEED)
	
	is_on_wall_slide = is_on_wall() and not is_on_floor()
	if is_on_wall_slide: velocity.y = min(velocity.y, WALL_SLIDE_SPEED)
	
	var floor_normal = get_floor_normal()
	var is_on_slope = is_on_floor() and abs(floor_normal.x) > 0.2
	var input_dir = Input.get_axis("ui_left", "ui_right")
	
	if input_dir != 0:
		speed = clamp(speed + input_dir * ACCELERATION * delta, -MAX_SPEED, MAX_SPEED)
		anim.scale.x = 1 if input_dir > 0 else -1
	elif is_on_slope:
		speed += floor_normal.x * 800.0 * delta
	else:
		speed = move_toward(speed, 0, FRICTION * delta)
	
	velocity.x = speed
	
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_wall_slide:
			velocity = Vector2(get_wall_normal().x * WALL_JUMP_VELOCITY.x, WALL_JUMP_VELOCITY.y)
			speed = velocity.x
		elif coyote_timer > 0:
			velocity.y = JUMP_VELOCITY
			coyote_timer = 0 
			
	move_and_slide()
	update_animation()

func update_animation():
	if is_on_wall_slide or not is_on_floor():
		anim.play("saltar")
	elif abs(velocity.x) > 10:
		if anim.animation not in ["correr_loop", "acelerar"]: anim.play("acelerar")
		elif anim.animation == "acelerar" and not anim.is_playing(): anim.play("correr_loop")
	else:
		anim.play("quieto")

func collect_ring():
	rings += 1
	_update_hud_rings()
	if GameManager: GameManager.add_ring()

func soltar_anillos_al_aire():
	for i in range(min(rings, 15)):
		var r = RingScene.instantiate()
		get_parent().call_deferred("add_child", r)
		r.global_position = global_position
		if "soltado" in r:
			r.soltado = true
			var ang = randf_range(0, TAU)
			r.velocidad = Vector2(cos(ang), sin(ang)) * randf_range(200, 450)

func _update_hud_rings():
	var hud = get_tree().current_scene.find_child("Hud", true, false)
	if hud: hud.actualizar_interfaz_anillos(rings)

func recibir_dano():
	if esta_invulnerable: return
	vidas -= 1
	
	var hud = get_tree().current_scene.find_child("Hud", true, false)
	if hud: hud.actualizar_interfaz_vidas(vidas)
	if GameManager: GameManager.lives = vidas
	
	if vidas <= 0: die()
	else: aplicar_efecto_dano()
	
	if has_node("Camera2D"): $Camera2D.apply_shake(5.0)

func hit():
	if esta_invulnerable: return
	if rings > 0:
		soltar_anillos_al_aire()
		rings = 0
		_update_hud_rings()
		if GameManager: GameManager.lose_rings()
		aplicar_efecto_dano()
	else: recibir_dano()

func aplicar_efecto_dano():
	esta_invulnerable = true
	velocity = Vector2(-300 if anim.scale.x > 0 else 300, -250)
	var tw = create_tween().set_loops(10)
	tw.tween_property(anim, "modulate:a", 0.2, 0.1)
	tw.tween_property(anim, "modulate:a", 1.0, 0.1)
	await get_tree().create_timer(2.0).timeout
	esta_invulnerable = false

func die():
	var path = "res://scenes/ui/GameOver.tscn"
	get_tree().change_scene_to_file(path) if ResourceLoader.exists(path) else get_tree().reload_current_scene()
