extends Area2D

var ordem
var interact=false
var excl

func _ready():
	$exclamacao3.visible = false

func _on_body_entered(body: Node2D) -> void:
	pass
	#interact=true

func _on_body_exited(body: Node2D) -> void:
	pass
func _process(delta): #corrigir tamanho da cena do cafe
	
	exclamacao()

func exclamacao():
	excl = Dialogic.VAR.get("exclamacao")
	
	if excl == 3:
		$exclamacao3.visible = true
	else:
		$exclamacao3.visible = false
