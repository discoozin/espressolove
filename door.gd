extends Area2D

class_name Door

@export var destination_level_tag: String
@export var destination_door_tag: String
@export var spawn_direction ="up"

@onready var spawn = $spawn
 
var interact=false

func _on_body_entered(body: Node2D) -> void:
	if body.name=="player":
		interact=true
		

func _on_body_exited(body: Node2D) -> void:
	interact=false
	
func _process(delta: float) -> void:
	if interact==true and Input.is_action_just_pressed("interact"):
		if name=="cafecena":
			get_tree().change_scene_to_file("res://Assets/Scenes/cafecena.tscn")
		if name=="cafecenacolorido":
			get_tree().change_scene_to_file("res://Assets/Scenes/cafecenacolorido.tscn")
		NavigationManager.go_to_level(destination_level_tag, destination_door_tag)
		print("foi")
	
