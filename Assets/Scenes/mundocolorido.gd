extends Node2D

var excl
var ordem = 0

func _ready() -> void:
	if NavigationManager.spawn_door_tag!=null:
		_on_level_spawn(NavigationManager.spawn_door_tag)
	
	if Global.abre == 1:
		Dialogic.start("contexto")
		Global.abre = 0
		
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
	
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and excl == 100:
		print("oi")
		get_tree().change_scene_to_file("res://Assets/Scenes/FINAL.tscn")

	
