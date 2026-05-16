extends Area2D

var velocidad_horizontal: float = 0.0
var velocidad_vertical: float = -450.0 # Impulso inicial hacia arriba (puedes subirlo si quieres curvas más altas)
var gravedad: float = 700.0

func configurar_direccion(posicion_sonic: Vector2):
	# 1. Calculamos la distancia horizontal real hasta Sonic
	var distancia_x = posicion_sonic.x - global_position.x
	
	# 2. FÓRMULA MATEMÁTICA DE TIEMPO DE VUELO:
	# Calculamos cuánto tarda la gravedad en frenar la subida de la bomba y hacerla caer 
	# al mismo nivel de altura. (Tiempo = 2 * velocidad_inicial / gravedad)
	var tiempo_vuelo = (2.0 * abs(velocidad_vertical)) / gravedad
	
	# 3. VELOCIDAD HORIZONTAL PERFECTA:
	# Espacio / Tiempo = Velocidad. Así llegará EXACTAMENTE a Sonic sin importar la distancia
	if tiempo_vuelo > 0:
		velocidad_horizontal = distancia_x / tiempo_vuelo
	else:
		velocidad_horizontal = 0.0

func _ready():
	body_entered.connect(_on_body_entered)

func _physics_process(delta):
	# Aplicamos la gravedad al eje Y
	velocidad_vertical += gravedad * delta
	
	# Movemos la bomba
	global_position.x += velocidad_horizontal * delta
	global_position.y += velocidad_vertical * delta
	
	# Si cae por debajo del escenario, se destruye
	if global_position.y > 1500:
		queue_free()

func _on_body_entered(body):
	if body.name == "Sonic":
		if body.has_method("recibir_dano"):
			body.recibir_dano()
		queue_free()
