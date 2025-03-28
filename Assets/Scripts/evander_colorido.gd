extends CharacterBody2D

@export var dialogo: String = "evander4"

var interativo = false
var excl 

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		interativo = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	interativo = false
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and interativo == true:
		Dialogic.start(dialogo)
	
	change_dialogue()
	
	exclamacao()


func exclamacao():
	excl = Dialogic.VAR.get("exclamacao")
		
	if excl == 14:
		$exclamacao99.visible = true
	else:
		$exclamacao99.visible = false
	
func change_dialogue():
	var muda_dialogo = Dialogic.VAR.get("mudatextger")
	
	if muda_dialogo == 3:
		dialogo = "evander4"
	if muda_dialogo == 4:
		pass
