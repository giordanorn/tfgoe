extends Node2D

export var strength = 0
onready var character = get_parent()

var _target

func _ready():
	$HitArea/Shape.set_shape(character.get_node("CollisionShape2D").get_shape())
	$HitArea/Shape.position = character.get_node("CollisionShape2D").position


func _process(delta) -> void:
	if _target:
		_target.take_damage(strength)


func _on_HitArea_body_entered(body):
	if body.is_in_group("player"):
		_target = body


func _on_HitArea_body_exited(body):
	if body.is_in_group("player"):
		_target = null
