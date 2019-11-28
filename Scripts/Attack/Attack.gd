extends Node

onready var character = get_parent()
onready var hit_area = $HitArea

export var strength = 1
export var animation_time:float = 0.25
export var cooldown:float = 0.1

func _ready():
	stop_attacking()


func _process(delta):
	if  attack_button_pressed() && !is_attacking() && !is_in_cooldown():
		attack()


func attack():
	add_child(hit_area)
	var shape = $HitArea/Shape.shape
	var area_size = hit_area.get_node("Shape").scale
	
	if character.is_facing_left():
		hit_area.position=Vector2(-shape.radius*area_size.x,0)
		$HitArea/AnimatedSprite.flip_h=true
		print()
	elif character.is_facing_right():
		hit_area.position=Vector2(shape.radius*area_size.x,0)
		$HitArea/AnimatedSprite.flip_h=false
	$AnimationCooldown.start(animation_time)


func stop_attacking():
	remove_child(hit_area)
	$AttackCooldown.start(cooldown)


func is_in_cooldown() -> bool:
	return !$AttackCooldown.is_stopped()


func is_attacking() -> bool:
	return !$AnimationCooldown.is_stopped()


func attack_button_pressed() -> bool:
	return Input.is_action_just_pressed("ui_accept")


func _on_HitArea_body_entered(target):
	if target.is_in_group("enemy"):
		print (character.nickname, ": hit ", target.nickname)
		target.take_damage(strength)
		pass


func _on_AnimationCooldown_timeout():
	stop_attacking()