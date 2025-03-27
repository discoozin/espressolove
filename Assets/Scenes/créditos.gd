extends Node2D
var button_type = null

func _ready():
	$fade_transition/fadetimer.connect("timeout", _on_fadetimer_timeout)
	#$fade_transition/AnimationPlayer.play("fadeout")


func _on_voltar_pressed():
	button_type="voltar"
	$fade_transition.show()
	$fade_transition/AnimationPlayer.play("fadein")
	$fade_transition/fadetimer.start(1.0)

func _on_fadetimer_timeout():
	print("Timer finished. button_type =", button_type)
	if button_type=="voltar":
		get_tree().change_scene_to_file("res://Assets/Scenes/menu.tscn")
