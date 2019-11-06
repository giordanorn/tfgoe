extends KinematicBody2D

const UP = Vector2(0,-1)
var move = Vector2()

export var speedX = 100
export var jumpForce = 200
export var gravity = 300

func _ready():
	pass
func _process(delta):
	pass

func move(direction):
	if direction=="right":
		move.x=-speedX
	elif(direction=="left"):
		move.x=speedX
func jump():
	move.y=-jumpForce