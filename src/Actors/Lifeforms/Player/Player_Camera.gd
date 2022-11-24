extends Camera2D


export var PIXELS_PER_PIXEL:float = 1


func _ready():
	var factor:float = 1.0 / PIXELS_PER_PIXEL
	zoom = Vector2(factor, factor)

func get_pixel_position_on_screen(pixel_position:Vector2) -> Vector2:
	var viewport_center = get_viewport().get_visible_rect().size / 2
	return (pixel_position - get_camera_screen_center()) * PIXELS_PER_PIXEL + viewport_center
	
	
