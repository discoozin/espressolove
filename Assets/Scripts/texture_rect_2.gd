extends TextureRect
@onready var panel_1: Panel = $"../TextureRect1/panel1"
@onready var panel_2: Panel = $panel2
@onready var gotascafe: CPUParticles2D = $"../gotascafe"
@onready var timer: Timer = $"../Timer"
@onready var somcafe: AudioStreamPlayer2D = $"../somcafe"
var escolha

func _process(delta: float) -> void:
	escolha = Dialogic.VAR.get("animcafe")
	
	if escolha == 1:
		gotascafe.emitting=true
		timer.start()
		Dialogic.VAR.set("animcafe", 0)
		somcafe.play()
func _can_drop_data(_pos, data):
	return true
func _drop_data(_pos, data):
	Dialogic.start("montar_pedidos")
	data[0].get_parent().remove_child(data[0])
	add_child(data[0])
	data[0].global_position=global_position
