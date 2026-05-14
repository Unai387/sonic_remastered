extends Area2D

@export var next_level_path: String = ""

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Sonic":
		complete_level()

func complete_level():
	var target = next_level_path if next_level_path != "" else "res://scenes/ui/level_complete.tscn"
	get_tree().change_scene_to_file(target)
