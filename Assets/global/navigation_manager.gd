extends Node

const scene_main=preload("res://Assets/Scenes/main.tscn")
const scene_cafecena=preload("res://Assets/Scenes/cafecena.tscn")
const scene_mundocolorido=preload("res://Assets/Scenes/mundocolorido.tscn")
const scene_cafecenacolorido=preload("res://Assets/Scenes/cafecenacolorido.tscn")

signal on_trigger_player_spawn

var spawn_door_tag

func go_to_level(level_tag, destination_tag):
	var scene_to_load
	
	match level_tag:
		"main":
			scene_to_load=scene_main
		"cafecena":
			scene_to_load=scene_cafecena
		"mundocolorido":
			scene_to_load=scene_mundocolorido
		"cafecenacolorido":
			scene_to_load=scene_cafecenacolorido
	if scene_to_load!=null:
		spawn_door_tag=destination_tag
		get_tree().change_scene_to_packed(scene_to_load)

func trigger_player_spawn(position:Vector2, direction:String):
	on_trigger_player_spawn.emit(position, direction)
