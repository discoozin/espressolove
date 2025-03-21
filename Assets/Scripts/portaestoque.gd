extends Area2D

var entrar = false

func _on_body_entered(body: CharacterBody2D) -> void:
	entrar=true
	

func _on_body_exited(body: Node2D) -> void:
	entrar=false

func _process(delta):
	if entrar==true:
		if Input.is_action_just_pressed("interact"):
			get_tree().change_scene_to_file("res://Assets/Scenes/estoque.tscn")
