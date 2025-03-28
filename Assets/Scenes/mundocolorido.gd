extends Node2D

var excl
var ordem 

func _ready() -> void:
	if NavigationManager.spawn_door_tag!=null:
		_on_level_spawn(NavigationManager.spawn_door_tag)

func _on_level_spawn(destination_tag:String):
	var door_path="Areacafe/Door" + destination_tag
	var door = get_node(door_path) as Door
	NavigationManager.trigger_player_spawn(door.spawn.global_position, door.spawn_direction)

func _process(delta: float) -> void:
	excl = Dialogic.VAR.get("exclamacao")
	ordem = Dialogic.VAR.get("ordempedidos")
	
	if excl == 3:
		$exclamacao123.visible = true
	else:
		$exclamacao123.visible = false

	if ordem == 58:
		$fade_transition.show()
		$fade_transition/AnimationPlayer.play("fadein")
		$fade_transition/fadetimer.start(1.0)
		
func _on_fadetimer_timeout():
	get_tree().change_scene_to_file("res://Assets/Scenes/FINAL.tscn")
	
