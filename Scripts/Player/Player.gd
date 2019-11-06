extends KinematicBody2D

const general_movement=preload("../Movement.gd")
onready var player_movement = general_movement.new()

func _ready():
	pass

func _process(delta):
	player_movement.move.y=player_movement.gravity
	if is_on_floor():
		player_movement.move.y=0;
	if Input.is_action_pressed("ui_up"):
		player_movement.jump()
	if Input.is_action_pressed("ui_left"):
		player_movement.move("right")
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		player_movement.move("left")
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.animation = "idle"
		player_movement.move.x=0
	move_and_slide(player_movement.move, player_movement.UP)
