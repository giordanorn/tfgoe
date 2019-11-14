extends Node

export (int) var current_hp = 1
export (int) var max_hp = 1

func set_max_hp(value:int):
	max_hp=value
	if current_hp>max_hp:
		current_hp=max_hp

func set_current_hp(value:int):
	if current_hp+value>max_hp:
		current_hp=max_hp
	else:
		current_hp=value

func reduce_current_hp(value:int):
	if value>current_hp:
		current_hp=0
	else:
		current_hp-=value

func reduce_max_hp(value:int):
	if value>=max_hp:
		return false
	else:
		max_hp-=value
		if current_hp>max_hp:
			current_hp=max_hp


func increase_current_hp(value:int):
	if value+current_hp>max_hp:
		current_hp=max_hp
	else:
		current_hp+=value

func increase_max_hp(value:int):
	max_hp+=value
	current_hp+=value

func reset_hp():
	current_hp=0
