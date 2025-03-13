extends Node2D

const SPEED: int = 3000

func _process(delta: float) -> void:
	position += transform.x * SPEED * delta # adjust for frame time, but slow
