extends CharacterBody2D
@export var movement_speed: float=500
var character_direction: Vector2
var parado
var ordem

func _physics_process(delta):	
	parado = Dialogic.VAR.get("podeandar")
	ordem = Dialogic.VAR.get("ordempedido")
	#flip e movimentação
	if not parado:
		character_direction.x = Input.get_axis("move_left", "move_right")
		character_direction.y = Input.get_axis("move_up", "move_down")
		if Input.is_action_pressed("move_left"):
			$sprite.play("rgbside")
			$sprite.flip_h=true
		elif Input.is_action_pressed("move_right"):
			$sprite.play("rgbside")
			$sprite.flip_h=false
		elif Input.is_action_pressed("move_up"):
			$sprite.play("rgbup")
		elif Input.is_action_pressed("move_down"):
			$sprite.play("rgbdown")
		else:
			$sprite.stop()
	if character_direction:
		velocity = character_direction * movement_speed
		
	else:	
		velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
	
	move_and_slide()
