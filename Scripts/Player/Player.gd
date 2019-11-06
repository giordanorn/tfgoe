extends KinematicBody2D

const UP = Vector2(0,-1)
var move = Vector2()

export var speedX = 100
export var jumpForce = 200
export var gravity = 300

func _ready():
	pass


func _process(delta):
	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.animation = "idle"
		
