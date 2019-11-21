extends KinematicBody2D

export var facing="right"


func _process(delta):
	
	if Input.is_action_pressed("ui_left"):
		facing="left"
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		facing="right"
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.animation = "idle"

func is_alive() -> bool:
	return !$Health.is_empty()

func take_damage(damage:int):
	# faz os tratamentos antes de tomar o dano
	$Health.reduce_current_hp(damage)