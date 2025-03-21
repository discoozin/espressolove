extends CharacterBody2D

@export var dialogo: String

var anim

#não precisa de explicação, é só a variavel pra ver se da pra interagir ou não BURRO BURRO BURRO
var interativo = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		interativo = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	interativo = false
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and interativo == true:
		Dialogic.start(dialogo)
