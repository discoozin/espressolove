extends TextureRect

func _get_drag_data(at_position):
	var preview = TextureRect.new()
	
	preview.texture=texture
	preview.expand_mode=1
	preview.size=Vector2(30,30)
	
	var preview2=Control.new()
	
	preview2.add_child(preview)
	
	set_drag_preview(preview)
	texture=null
	
	return preview.texture
	
