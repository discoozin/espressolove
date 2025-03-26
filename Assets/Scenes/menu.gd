extends Node2D

var button_type = null  # Stores which button was pressed

func _ready():
	$fade_transition/fadetimer.connect("timeout", _on_fadetimer_timeout)

func _on_jogar_pressed():
	button_type = "jogar"  # Set this first!
	$fade_transition.show()
	$fade_transition/AnimationPlayer.play("fadein")
	$fade_transition/fadetimer.start(1.0)  # Start timer AFTER animation starts

func _on_créditos_pressed():
	button_type = "créditos"
	$fade_transition.show()
	$fade_transition/AnimationPlayer.play("fadein")
	$fade_transition/fadetimer.start(1.0)

func _on_sair_pressed():
	get_tree().quit()

func _on_fadetimer_timeout():
	print("Timer finished. button_type =", button_type)
	if button_type == "jogar":
		print("Changing scene to: main.tscn")
		get_tree().change_scene_to_file("res://Assets/Scenes/main.tscn")
	elif button_type == "créditos":
		print("Changing scene to: créditos.tscn")
		get_tree().change_scene_to_file("res://Assets/Scenes/créditos.tscn")
