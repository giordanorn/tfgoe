extends KinematicBody2D

onready var game_info = get_node("/root/GameController")
export (String) var nickname = ""

func _process(delta):
	if is_alive():
		update_sprite()
	else:
		rip()

func update_sprite() -> bool:
	if not has_sprite() or not has_movement():
		return false
	else:
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
		print (nickname, ": receiving ", damage, " of damage, I have ", $Health.current_hp, " of current HP")
		return $Health.reduce_current_hp(damage)
	else:
		print_debug("character has no health")
		return false

func is_alive() -> bool:
	return not $Health.is_empty()

func rip():
	"""
	É possível elaborar uma animação de morte
	Colocar um cooldown e após acabar chamar o queue_free.
	"""
	queue_free()
	if self.is_in_group("player"):
		get_tree().change_scene("res://States/Game Over.tscn")
	if self.is_in_group("enemy"):
		game_info.xp+=1
		game_info.total_score+=1

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

func has_HUD() -> bool:
	return has_node("HUD")
