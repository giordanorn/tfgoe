extends Node

onready var movement = get_parent()

var direction: = 1

func _ready() -> void:
	var rng: = RandomNumberGenerator.new()
	rng.randomize()
	var first_flip_time: = rng.randf_range(0, $FlipDirection.wait_time)
	var backup = $FlipDirection.wait_time
	$FlipDirection.start(first_flip_time)
	$FlipDirection.wait_time = backup


func get_input(velocity, speed, jump_speed) -> Vector2:
	velocity.x += speed * get_direction()
	return velocity


func get_direction() -> int:
	return direction


func _on_Timer_timeout() -> void:
	direction *= -1
	$FlipDirection.start()
