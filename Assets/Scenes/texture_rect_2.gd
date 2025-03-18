extends TextureRect
@onready var panel_1: Panel = $"../TextureRect1/panel1"
@onready var panel_2: Panel = $panel2
@onready var gotascafe: CPUParticles2D = $"../gotascafe"
@onready var timer: Timer = $"../Timer"
var escolha

func _process(delta: float) -> void:
	escolha = Dialogic.VAR.get("animcafe")
	
	if escolha == 1:
		gotascafe.emitting=true
		timer.start()
		Dialogic.VAR.set("animcafe", 0)
		
func _can_drop_data(_pos, data):
	return data is Texture2D

func _drop_data(_pos, data):
	Dialogic.start("montar_pedidos")
	texture=data
	panel_1.queue_free()
	panel_2.visible=false
	
