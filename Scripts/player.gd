extends CharacterBody2D

var speed = 500

func _physics_process(delta): # movement processing
	var inputVector = Vector2.ZERO
	inputVector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	inputVector.y = Input.get_action_strength("back") - Input.get_action_strength("forward")
	inputVector = inputVector.normalized()
	
	if inputVector:
		velocity = inputVector * speed
		move_and_slide()
