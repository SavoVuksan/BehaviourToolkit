extends Camera2D


@export var speed: float = 300.0
@export var zoom_speed: float = 0.1


func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		position.x += speed * delta
	if Input.is_action_pressed("ui_left"):
		position.x -= speed * delta
	if Input.is_action_pressed("ui_down"):
		position.y += speed * delta
	if Input.is_action_pressed("ui_up"):
		position.y -= speed * delta


func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				zoom += Vector2.ONE * zoom_speed
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				zoom -= Vector2.ONE * zoom_speed
