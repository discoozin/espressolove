extends Area2D

var ordem
var interact=false

func _ready():
	$exclamacao3.visible = false

func _on_body_entered(body: Node2D) -> void:
	interact=true

func _on_body_exited(body: Node2D) -> void:
	interact=false
func _process(delta): #corrigir tamanho da cena do cafe
	ordem = Dialogic.VAR.get("ordempedido")
	 
	if interact==true:
		if Input.is_action_just_pressed("interact"):
			get_tree().change_scene_to_file("res://Assets/Scenes/cafecena.tscn")		
	
	if ordem == 3:
		$exclamacao3.visible = true
	else:
		$exclamacao3.visible = false
