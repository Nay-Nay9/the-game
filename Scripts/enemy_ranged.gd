extends CharacterBody2D

const TARGET: int = 300 # target distance from player
var speed: int = 300
var dist: float
var moveThresh: int = 5 # distance where the enemy stops moving

@onready var player = $"../Player" # declare player as a variable

func _physics_process(delta: float) -> void:
	velocity = Vector2()
	dist = sqrt((position.x - player.position.x) ** 2 + (position.y - player.position.y) ** 2)

	if position.x > player.position.x: # player chase coding
		velocity.x -= 1
	if position.x < player.position.x:
		velocity.x += 1
	if position.y > player.position.y:
		velocity.y -= 1
	if position.y < player.position.y:
		velocity.y += 1
		
	if dist < TARGET: # if to close invert speed, run away
		velocity *= -1
	
	if abs(position.x - player.position.x) < moveThresh: # stop when close enough to tgt
		velocity.x = 0
	if abs(position.y - player.position.y) < moveThresh:
		velocity.y = 0
		
	if abs(dist - TARGET) < moveThresh:
		velocity.x = 0
		velocity.y = 0
	velocity = velocity.normalized()
	velocity = velocity * speed
	move_and_slide()
