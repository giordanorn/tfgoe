extends Node

onready var movement = get_parent()

func get_input(velocity, speed, jump_speed) -> Vector2:
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	if Input.is_action_just_pressed("ui_up"):
		if movement.body.is_on_floor():
			velocity.y = -jump_speed
	return velocity
