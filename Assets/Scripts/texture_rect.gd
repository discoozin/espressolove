extends TextureRect
@onready var texture_rect_1: TextureRect = $"."

func _get_drag_data(at_position):
	var data=[self, 1]
	var preview = TextureRect.new()
	preview.texture=texture
	set_drag_preview(preview)
	return preview.texture
	return data
