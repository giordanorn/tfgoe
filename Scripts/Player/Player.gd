extends KinematicBody2D

export var facing:String

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
