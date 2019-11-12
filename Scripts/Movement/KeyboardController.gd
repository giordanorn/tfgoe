extends Node

onready var movement = get_parent()

func get_input(velocity) -> Vector2:
	if Input.is_action_pressed("ui_left"):
		velocity.x -= movement.speed
	if Input.is_action_pressed("ui_right"):
		velocity.x += movement.speed
	if Input.is_action_just_pressed("ui_up"):
		if movement.body.is_on_floor():
			velocity.y = -movement.jump_speed
	return velocity
