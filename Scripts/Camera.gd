extends Camera2D


var zoom_max = 3
var zoom_min = 0.3
var zoom_factor = 1
var zoom_speed = 20
var zoom_step = 0.03
var factor_step = 0.02

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	zoom.x = lerp(zoom.x, zoom_factor*zoom.x, zoom_speed*delta)
	zoom.y = lerp(zoom.y, zoom_factor*zoom.y, zoom_speed*delta)
	
	zoom.x = clamp(zoom.x, zoom_min, zoom_max)
	zoom.y = clamp(zoom.y, zoom_min, zoom_max)

	if zoom_factor > 1:
		zoom_factor -= factor_step
	if zoom_factor < 1:
		zoom_factor += factor_step

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom_factor -= zoom_step
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom_factor += zoom_step
