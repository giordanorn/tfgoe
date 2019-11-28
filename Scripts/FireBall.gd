extends KinematicBody2D

export var damage: = 3
export var speed: = 100
export var direction: = -1

func _ready():
	pass # Replace with function body.


func _process(delta):
	move_and_slide(Vector2(direction*speed,0),Vector2.RIGHT)
	if is_on_floor() or is_on_wall():
		queue_free()


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(damage)
		queue_free()
