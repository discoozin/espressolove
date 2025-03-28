extends Node2D

@onready var gotascafe: CPUParticles2D = $gotascafe
@onready var cafepronto: Sprite2D = $cafepronto
@onready var texture_rect_1: TextureRect = $TextureRect1

func _on_timer_timeout() -> void:
	gotascafe.emitting=false
	texture_rect_1.visible=false
	cafepronto.visible=true
	$textocafepronto.visible=true

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		NavigationManager.go_to_level("mundocolorido", "Cafeteria" )
