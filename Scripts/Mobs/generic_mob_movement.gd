extends KinematicBody2D

const UP = Vector2(0,-1)
var move = Vector2()
export var speedX = 100
export var gravity = 300

func _ready():
	pass

func movement(direction):
	if is_on_floor():
		move.y=0
	else:
		move.y+=gravity
	if direction=="right":
		$AnimatedSprite.flip_h=false
		$AnimatedSprite.animation="run"
		move.x=speedX
	elif direction=="left":
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.animation="run"
		move.x=-speedX
	else:
		$AnimatedSprite.animation="idle"
		move.x=0
	move_and_slide(move,UP)
		
func _process(delta):
	movement("")
