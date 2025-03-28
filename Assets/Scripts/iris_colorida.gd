extends CharacterBody2D

@export var dialogo: String

var interativo = false
var excl
var contador = 1

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		interativo = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	interativo = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and interativo == true:
		Dialogic.start(dialogo)
	exclamacao()
	anim()

func anim():
	var sai = Dialogic.VAR.get("exclamacao")
	
	if sai == 100 and contador == 1:
		$"../../Animações/AnimationPlayer".play("iris_saindo")
		contador = 0

func exclamacao():
	excl = Dialogic.VAR.get("exclamacao")
		
	if excl == 14:
		$exclamacao9.visible = true
	else:
		$exclamacao9.visible = false
