extends CanvasLayer

var corazones = []
var tiempo_total: float = 0.0

@onready var RingLabel = find_child("RingLabel", true, false)
@onready var TimeLabel = find_child("TimeLabel", true, false)

func _ready():
	for i in range(1, 4):
		corazones.append(find_child("Corazon" + str(i), true, false))
	actualizar_interfaz_vidas(3)

func _process(delta):
	tiempo_total += delta
	actualizar_interfaz_tiempo()

func actualizar_interfaz_anillos(cantidad: int):
	if RingLabel: RingLabel.text = "Rings: " + str(cantidad)

func actualizar_interfaz_tiempo():
	if TimeLabel:
		var mins = int(tiempo_total / 60)
		var segs = int(tiempo_total) % 60
		TimeLabel.text = str(mins) + ":" + str(segs).pad_zeros(2)

func actualizar_interfaz_vidas(vidas: int):
	for i in range(corazones.size()):
		var c = corazones[i]
		if not c: continue
		if i < vidas:
			c.visible = true
			c.modulate = Color.WHITE
		elif vidas == 0 and i == 0:
			var tw = create_tween().set_loops()
			tw.tween_property(c, "modulate", Color.RED, 0.1)
			tw.tween_property(c, "modulate", Color(1, 1, 1, 0.2), 0.1)
		else:
			c.visible = false
