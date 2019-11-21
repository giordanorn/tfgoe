extends KinematicBody2D

func _process(delta):
	update_sprite()

func update_sprite() -> void:
	if !has_sprite() || !has_movement():
		return
	if $Movement.is_moving_right():
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_h = false
	elif $Movement.is_moving_left():
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.animation = "idle"	

func take_damage(damage:int) -> void:
	if has_health():
		# faz os tratamentos antes de receber o dano
		$Health.reduce_current_hp(damage)
	else:
		print_debug("character has no health")

func is_alive() -> bool:
	return !$Health.is_empty()

func is_facing_right() -> bool:
	if has_sprite():
		return !$AnimatedSprite.flip_h
	else:
		return true

func is_facing_left() -> bool:
	return !is_facing_right()

func has_health() -> bool:
	return has_node("Health")

func has_sprite() -> bool:
	return has_node("AnimatedSprite")

func has_movement() -> bool:
	return has_node("Movement")