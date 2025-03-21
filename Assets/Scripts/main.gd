extends Node2D
@onready var player: CharacterBody2D = $characters/player

var change_scene=false

func _ready() -> void:
	if Global.last_pos!=Vector2(0, 0):
		print(Global.last_pos)
		$characters/player.position=Global.last_pos+Vector2(0, 5)


func _on_salaestoque_body_entered(body: Node2D) -> void:
	change_scene=true

func _process(delta: float) -> void:
	if change_scene==true:
		if Input.is_action_just_pressed("interact"):
			get_tree().change_scene_to_file("res://Assets/Scenes/estoque.tscn")
			
