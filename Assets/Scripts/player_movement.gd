extends CharacterBody2D

@export var movement_speed: float=500
var character_direction: Vector2

func _physics_process(delta):
	character_direction.x = Input.get_axis("move_left", "move_right")
	character_direction.y = Input.get_axis("move_up", "move_down")
	
	#flip
	if character_direction.x > 0: %sprite.flip_h = false
	#elif character_direction.x <0: %sprite.filp_h = true
	
	if character_direction:
		velocity = character_direction * movement_speed
		#add animaçao andar sprite %sprite
	else:	
		velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
		#add animaçao andar sprite %sprite
	
	move_and_slide()
