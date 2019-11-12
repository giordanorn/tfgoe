extends KinematicBody2D

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.animation = "idle"
