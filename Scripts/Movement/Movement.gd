extends Node

onready var body: = get_parent()

export var speed: = 100
export var jump_speed: = 200
export var gravity: = 500

var velocity: = Vector2.ZERO


func _physics_process(delta) -> void:
	"""
	Reseta a velocidade horizontal
	Não queremos utilizar aceleração horizontal.
	"""
	velocity.x = 0
	
	apply_gravity(delta)
	
	if has_controller():
		apply_controller_movement()
	
	move()


func apply_controller_movement() -> void:
	velocity = $Controller.get_input(velocity, speed, jump_speed)


func apply_gravity(delta) -> void:
	if body.is_on_floor():
		velocity.y = 10
	else:
		velocity.y = min(velocity.y + gravity * delta, jump_speed)


func move() -> void:
	body.move_and_slide(velocity, Vector2.UP)


func has_controller() -> bool:
	return has_node("Controller")


func is_moving_right() -> bool:
	return velocity.x > 0


func is_moving_left() -> bool:
	return velocity.x < 0


func is_moving_horizontally() -> bool:
	return velocity.x != 0