extends CharacterBody2D

#exporta a variavel dialogo, sendo possivel alterar fora do codigo
@export var dialogo: String

#não precisa de explicação, é só a variavel pra ver se da pra interagir ou não BURRO BURRO BURRO
var interativo = false
var ordem = 0 #Dialogic.VAR.get("ordempedidos")
var anim = 2
var excl = 0

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		interativo = true
		
func _on_area_2d_body_exited(body: Node2D) -> void:
	interativo = false
	
	if ordem == 7:
		anim = 0

func _process(delta: float) -> void:
	ordem = Dialogic.VAR.get("ordempedidos")
	excl = Dialogic.VAR.get("exclamacao")
	
	if Input.is_action_just_pressed("interact") and interativo == true:
		Dialogic.start(dialogo)
	
	
	exclamacao()

func exclamacao():
	excl = Dialogic.VAR.get("exclamacao")
	
	if excl == 6:
		$exclamacao3.visible = true
	else:
		$exclamacao3.visible = false

func animsaida():
	if ordem == 7 and anim == 0:
		$"../../AnimationPlayer".play("cliente2_saindo")
		anim = 1
		await $"../../AnimationPlayer".animation_finished
		Global.velha = true
