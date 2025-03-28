extends Node2D

@onready var gotascafe: CPUParticles2D = $gotascafe
@onready var cafepronto: Sprite2D = $cafepronto
@onready var texture_rect_1: TextureRect = $TextureRect1

var qualcafe

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	qualcafe = Dialogic.VAR.get("qualcafe")
	
	if Input.is_action_just_pressed("interact"):
		NavigationManager.go_to_level("main", "Cafeteria" ) #resolvernonavigator
		Dialogic.VAR.set("animcafe", 0)
	if qualcafe == 1:
		$Label.text = "O cliente quer um\n Expresso"
	if qualcafe == 2:
		$Label.text = "O cliente quer um\n Capuccino"
	if qualcafe == 3:
		$Label.text = "O cliente quer um\n Café com leite"

func _on_timer_timeout() -> void:
	gotascafe.emitting=false
	texture_rect_1.visible=false
	cafepronto.visible=true
	$textocafepronto.visible=true
