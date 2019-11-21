extends KinematicBody2D

export (String) var nickname = ""

func _process(delta):
	if is_alive():
		update_sprite()
	else:
		queue_free()

func update_sprite() -> bool:
	if not has_sprite() or not has_movement():
		return false
		
	if $Movement.is_moving_right():
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_h = false
	elif $Movement.is_moving_left():
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.animation = "idle"
	return true

func take_damage(damage:int) -> bool:
	if has_health():
		"""
		Aqui devem ser feito os tratamentos no damage
		antes de aplicar a função de receber o dano.
		"""
		print (nickname, ": just receiving ", damage, " of damage, I have ", $Health.current_hp, " of current HP")
		return $Health.reduce_current_hp(damage)
	else:
		print_debug("character has no health")
		return false

func is_alive() -> bool:
	return not $Health.is_empty()

func is_facing_right() -> bool:
	if has_sprite():
		return !$AnimatedSprite.flip_h
	else:
		return true

func is_facing_left() -> bool:
	return not is_facing_right()

func has_health() -> bool:
	return has_node("Health")

func has_sprite() -> bool:
	return has_node("AnimatedSprite")

func has_movement() -> bool:
	return has_node("Movement")