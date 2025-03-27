extends Node2D

var ordem

func _physics_process(delta: float) -> void:
	ordem = Dialogic.VAR.get("ordempedido")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and ordem == 10:
		get_tree().change_scene_to_file("res://Assets/Scenes/mundocolorido.tscn")

func _ready():
	if Global.bernardo == true:
		$npc/cliente_generico_1.queue_free()
	if Global.velha == true:
		$npc/cliente_generico_2.queue_free()
