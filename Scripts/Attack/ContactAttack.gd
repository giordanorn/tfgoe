extends Node2D

export var strength = 0
onready var character = get_parent()


func _ready():
	$HitArea/Shape.set_shape(character.get_node("CollisionShape2D").get_shape())
	$HitArea/Shape.position = character.get_node("CollisionShape2D").position
	character.set_collision_layer(2)
	character.set_collision_mask(2)


func _on_HitArea_body_entered(target):
	if target.is_in_group("player"):
		print (character.nickname, ": hit ", target.nickname)
		target.take_damage(strength)