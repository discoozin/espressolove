extends CharacterBody2D

class_name Player

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
			$sprite.play("bwside")
			$sprite.flip_h=true
		elif Input.is_action_pressed("move_right"):
			$sprite.play("bwside")
			$sprite.flip_h=false
		elif Input.is_action_pressed("move_up"):
			$sprite.play("bwup")
		elif Input.is_action_pressed("move_down"):
			$sprite.play("bwdown")
		else:
			$sprite.stop()
	if character_direction:
		velocity = character_direction * movement_speed
		
	else:	
		velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
	
	move_and_slide()

func _ready() -> void:
	NavigationManager.on_trigger_player_spawn.connect(_on_spawn)
	
func _on_spawn(position:Vector2, direction:String):
	global_position=position
	$sprite.play("bwcafe")
	await get_tree().create_timer(0.2).timeout
	$sprite.flip_h=true
