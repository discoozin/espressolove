extends Node2D


func _ready() -> void:
	if Input.is_action_just_pressed("trocarmundo"):
		get_tree().change_scene_to_file("res://Assets/Scenes/mundocolorido.tscn")
	
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("trocarmundo"):
		get_tree().change_scene_to_file("res://Assets/Scenes/mundocolorido.tscn")


func _on_area_2d_body_entered(body: Node2D) -> void:
	Dialogic.start("testes")
