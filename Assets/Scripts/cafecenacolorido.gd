extends Node2D

@onready var gotascafe: CPUParticles2D = $gotascafe
@onready var cafepronto: Sprite2D = $cafepronto
@onready var texture_rect_1: TextureRect = $TextureRect1

var qualcafe 

func _on_timer_timeout() -> void:
	gotascafe.emitting=false
	texture_rect_1.visible=false
	cafepronto.visible=true
	$textocafepronto.visible=true

func _process(delta: float) -> void:
	qualcafe = Dialogic.VAR.get("qualcafe")
	
	if Input.is_action_just_pressed("interact"):
		NavigationManager.go_to_level("mundocolorido", "Cafeteria" )

	if qualcafe == 1:
		$Label.text = "O cliente quer um\n Expresso"
	if qualcafe == 2:
		$Label.text = "O cliente quer um\n Capuccino"
	if qualcafe == 3:
		$Label.text = "O cliente quer um\n Café com leite"
