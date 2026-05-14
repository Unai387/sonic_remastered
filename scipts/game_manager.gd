extends Node

signal ring_count_changed

var rings = 0
var lives = 3
var current_level = 1

func add_ring():
	rings += 1
	ring_count_changed.emit()

func lose_rings():
	rings = 0
	ring_count_changed.emit()

func reset_game():
	rings = 0
	lives = 3
	current_level = 1
	ring_count_changed.emit()

func next_level():
	current_level += 1
