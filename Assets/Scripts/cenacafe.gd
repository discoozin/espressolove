extends Node2D

@onready var player: CharacterBody2D = $player
@onready var gotascafe: CPUParticles2D = $gotascafe
@onready var cafepronto: Sprite2D = $cafepronto
@onready var texture_rect_1: TextureRect = $TextureRect1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://Assets/Scenes/main.tscn")
		Dialogic.VAR.set("animcafe", 0)

func _on_timer_timeout() -> void:
	gotascafe.emitting=false
	texture_rect_1.visible=false
	cafepronto.visible=true
	
