extends Node2D

func _ready():
	$fade_transition/AnimationPlayer.play("fadeout")
