extends Node

onready var movement = get_parent()

export var chase:bool = true
# Add extra speed when chasing
export var chase_speed:int = 50

var direction: = 1
var target
var is_detecting:bool = false

func _ready() -> void:
	var rng: = RandomNumberGenerator.new()
	rng.randomize()
	var first_flip_time: = rng.randf_range(0, $FlipDirection.wait_time)
	var backup = $FlipDirection.wait_time
	$FlipDirection.start(first_flip_time)
	$FlipDirection.wait_time = backup
	

func get_input(velocity, speed, jump_speed) -> Vector2:
	if can_chase() and is_detecting:
		var my_x: = movement.body.global_position.x as int
		var my_y: = movement.body.global_position.y as int
		var target_x: = target.global_position.x as int
		var target_y: = target.global_position.y as int
		
		if target_x - my_x > 0:
			direction = 1
		else:
			direction = -1
		
		if target_x == my_x:
			velocity.x = -speed
		else:
			velocity.x += chase_speed
		
		if target_y - my_y < -20:
			if movement.body.is_on_floor():
				velocity.y = -jump_speed
		
	velocity.x += speed
	velocity.x *= get_direction()
	
	return velocity


func can_chase() -> bool:
	return chase


func get_direction() -> int:
	return direction


func _on_Timer_timeout() -> void:
	direction *= -1
	$FlipDirection.start()


func _on_DetectArea_body_entered(body) -> void:
	if body.is_in_group("player"):
		$FlipDirection.stop()
		target = body
		is_detecting = true


func _on_DetectArea_body_exited(body) -> void:
	if body.is_in_group("player"):
		$FlipDirection.start()
		target = null
		is_detecting = false
