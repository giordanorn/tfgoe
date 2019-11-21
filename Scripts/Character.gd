extends KinematicBody2D

enum { LEFT, RIGHT }

var facing = RIGHT

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		facing = LEFT
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		facing = RIGHT
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.animation = "idle"

func is_alive() -> bool:
	return !$Health.is_empty()

func take_damage(damage:int):
	if has_health():
		# faz os tratamentos antes de receber o dano
		$Health.reduce_current_hp(damage)
	else:
		print_debug("character has no health")

func has_health() -> bool:
	return has_node("Health")

func is_facing_left() -> bool:
	return facing == LEFT
	
func is_facing_right() -> bool:
	return facing == RIGHT