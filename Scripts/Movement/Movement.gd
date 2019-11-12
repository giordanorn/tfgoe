extends Node

onready var body = get_parent()
onready var controller = get_child(0) # TODO: improve this access to controlle child node

export (int) var speed = 100
export (int) var jump_speed = 200
export (int) var gravity = 500

var velocity = Vector2.ZERO

func _physics_process(delta):
	apply_gravity(delta)
	apply_controller_movement()
	move()

func apply_controller_movement():
	velocity = controller.get_input(Vector2(0, velocity.y))

func apply_gravity(delta):
	velocity.y += gravity * delta

func move():
	body.move_and_slide(velocity, Vector2.UP)