extends Node2D

@onready var player: CharacterBody2D = $player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://Assets/Scenes/main.tscn")
