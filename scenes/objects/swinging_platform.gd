extends Node2D

@export var swing_distance = 150.0
@export var swing_speed = 1.0

var time = 0.0
var start_pos = Vector2.ZERO

func _ready():
	start_pos = $Platform.global_position

func _process(delta):
	time += delta * swing_speed
	$Platform.global_position.x = start_pos.x + sin(time) * swing_distance
	$Platform.global_position.y = start_pos.y
