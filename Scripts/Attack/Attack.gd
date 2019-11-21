extends Node

export var strength = 0
export var animation_time:float = 0.5
export var cooldown:float = 1

onready var character = get_parent()
onready var hit_area = $HitArea

func _ready():
	stop_attacking()

func _process(delta):
	if  attack_button_pressed() && !is_attacking() && !is_in_cooldown():
		attack()

func attack():
	add_child(hit_area)
	var shape = $HitArea/Shape.shape
	if character.is_facing_left():
		hit_area.position=Vector2(-shape.radius,0)
	elif character.is_facing_right():
		hit_area.position=Vector2(shape.radius,0)
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
	
func _on_HitArea_body_entered(body):
	if body.is_in_group("enemy"):
		body.take_damage(strength)
		pass

func _on_AnimationCooldown_timeout():
	stop_attacking()