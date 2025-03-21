extends Area2D
@onready var player: CharacterBody2D = $"../../characters/player"


var change_scene=false

func _on_body_entered(body: Node2D) -> void:
	change_scene=true

func _on_body_exited(body: Node2D) -> void:
	change_scene=false
func _process(delta): #corrigir tamanho da cena do cafe
	if change_scene==true:
		if Input.is_action_just_pressed("interact"):
			get_tree().change_scene_to_file("res://Assets/Scenes/cafecena.tscn")
			
