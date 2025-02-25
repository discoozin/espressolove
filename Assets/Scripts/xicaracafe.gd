extends TextureRect
#criar variavel cafe especifico
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _get_drag_data(at_position):
	return texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _can_drop_data(_pos, data):
	return data is Texture2D
	
func _drop_data(_pos, data):
	texture = data
	#return adquirir a variavel do cafe especifico
	timer.start()
	


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/main.tscn")
