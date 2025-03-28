extends CharacterBody2D

#exporta a variavel dialogo, sendo possivel alterar fora do codigo
@export var dialogo: String

var ordem =0 #Dialogic.VAR.get("ordempedido")
var anim = 2
var excl = 0


func _ready():
	$exclamacao.visible = false

#não precisa de explicação, é só a variavel pra ver se da pra interagir ou não BURRO BURRO BURRO
var interativo = false

#SEGUINTE, ISSO AQUI VERIFICA SE TODOS OS CORPOS QUE ESTÃO NO GRUPO "PLAYER" ENTRAREM NA AREA DA COLISÃO "INTERAÇÃO1"
#SE ENTRAR, QUER DIZER Q O NPC É INTERATIVO.
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		interativo = true

#TODA VEZ QUE O PLAYER SAIR DA AREA DE "INTERAÇÃO1", O INTERATIVO É FALSO
#da pra colocar outras coisas aqui tbm, mas não sei oq tu v
func _on_area_2d_body_exited(body: Node2D) -> void:
	interativo = false
	
	if ordem == 5:
		anim = 0
	
#TU SABE OQ O _PROCESS FAZ NÉ?
func _process(delta: float) -> void:
	ordem = Dialogic.VAR.get("ordempedido")
	#o if verifica se a tecla E ta sendo pressionada e se o interativo é verdadeiro, se sim
	#ele executa o Dialogic, acho que da pra fazer o player parar de andar com isso aqui, mas não sei dizer
	if Input.is_action_just_pressed("interact") and interativo == true:
		Dialogic.start(dialogo)
	
	exclamacao()
	animsaida()
	
func exclamacao():
	excl = Dialogic.VAR.get("exclamacao")

	if excl == 1 or excl == 4:
		$exclamacao.visible = true
	else:
		$exclamacao.visible = false
	
func animsaida():
	if ordem == 5 and anim == 0:
		$"../../AnimationPlayer".play("cliente1_saindo")
		anim = 1
		await $"../../AnimationPlayer".animation_finished
		Global.bernardo = true
