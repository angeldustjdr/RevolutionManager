extends Camera2D

var zoomMin = Vector2(0.2,0.2)
var zoomMax = Vector2(3.0,3.0)
var zoomSpeed = Vector2(0.1,0.1)

var drag = false
var cameraStartPosition
var mouseStartPostion

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			if self.zoom > zoomMin : self.zoom -= zoomSpeed
		if event.is_pressed() and event.button_index == MOUSE_BUTTON_WHEEL_UP:
			if self.zoom < zoomMax : self.zoom += zoomSpeed 
		
		if event.is_pressed() and event.button_index == MOUSE_BUTTON_MIDDLE :
			cameraStartPosition = self.position
			mouseStartPostion = get_local_mouse_position()
			drag = true
		if event.is_released() and event.button_index == MOUSE_BUTTON_MIDDLE : 
			drag = false

func _process(_delta):
	if drag : self.position = cameraStartPosition - (get_local_mouse_position()-mouseStartPostion)

