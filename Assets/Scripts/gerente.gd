extends CharacterBody2D

#exporta a variavel dialogo, sendo possivel alterar fora do codigo
@export var dialogo: String = "tutorial"

#não precisa de explicação, é só a variavel pra ver se da pra interagir ou não BURRO BURRO BURRO
var interativo = false
var muda_dialogo
var excl

func _ready():
	$exclamacao2.visible = false

#SEGUINTE, ISSO AQUI VERIFICA SE TODOS OS CORPOS QUE ESTÃO NO GRUPO "PLAYER" ENTRAREM NA AREA DA COLISÃO "INTERAÇÃO1"
#SE ENTRAR, QUER DIZER Q O NPC É INTERATIVO.
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		interativo = true

#TODA VEZ QUE O PLAYER SAIR DA AREA DE "INTERAÇÃO1", O INTERATIVO É FALSO
#da pra colocar outras coisas aqui tbm, mas não sei oq tu vai colocar, então to nem ai 
func _on_area_2d_body_exited(body: Node2D) -> void:
	interativo = false

#TU SABE OQ O _PROCESS FAZ NÉ?
func _process(delta: float) -> void:
	excl = Dialogic.VAR.get("exclamacao")
	change_dialogue()
	
	#o if verifica se a tecla E ta sendo pressionada e se o interativo é verdadeiro, se sim
	#ele executa o Dialogic, acho que da pra fazer o player parar de andar com isso aqui, mas não sei dizer
	if Input.is_action_just_pressed("interact") and interativo == true:
		Dialogic.start(dialogo)
	if excl == 0 or excl == 2 or excl == 5 or excl == 7:
		$exclamacao2.visible = true
	else:
		$exclamacao2.visible = false
		
	
func change_dialogue():
	muda_dialogo = Dialogic.VAR.get("mudatextger")
	
	if muda_dialogo == 1:
		dialogo = "evander2"
	if muda_dialogo == 2:
		dialogo = "evander3"
