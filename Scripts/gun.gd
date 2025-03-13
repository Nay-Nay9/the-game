extends Node2D

const BULLET = preload("res://Scenes/bullet.tscn")

func _process(delta: float) -> void: # aim at mouse
	look_at(get_global_mouse_position())
	
	rotation_degrees = wrap(rotation_degrees, 0, 360) # mirror gun when inverted
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -1
	else:
		scale.y = 1

	if Input.is_action_just_pressed("LMB"): # shoot check
		var bullet_instance = BULLET.instantiate() # "function" to create bullet?
		get_tree().root.add_child(bullet_instance) # creating bullet w/ proper parent
		bullet_instance.global_position = global_position
		bullet_instance.rotation = rotation
