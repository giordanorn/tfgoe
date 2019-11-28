extends Node

export (int) var current_hp = 2
export (int) var max_hp = 2


func set_max_hp(value:int):
	if value<0:
		print_debug("tentativa de setar o hp maximo para um valor negativo")
	else:
		max_hp=value
		if current_hp>max_hp:
			current_hp=max_hp
		if get_parent().is_in_group("player"):
			GameController.max_hp = max_hp


func set_current_hp(value:int):
	if value<0:
		print_debug("tentativa de setar o hp para um valor negativo")
	else:
		if current_hp+value>max_hp:
			current_hp=max_hp
		else:
			current_hp=value
		if get_parent().is_in_group("player"):
			GameController.current_hp = current_hp


func reduce_current_hp(value:int) -> bool:
	if value < 0:
		print_debug("can't reduce current hp in a negative value")
		return false
	else:
		current_hp = max(0, current_hp - value)
		if get_parent().is_in_group("player"):
			GameController.current_hp = current_hp
		return true


func reduce_max_hp(value:int) -> bool:
	"""
	Diminui o valor do HP Máximo
	Atualiza o HP Atual caso o HP Máximo seja reduzido
	a um valor menor que o atual, não deixando ser maior que o máximo.
	"""
	if value < 0:
		print_debug("can't reduce max hp in a negative value")
		return false
	else:
		max_hp = max(0, max_hp - value)
		current_hp = min(current_hp, max_hp)
		if get_parent().is_in_group("player"):
			GameController.max_hp = max_hp
			GameController.current_hp = current_hp
		return true


func increase_current_hp(value:int):
	if value<0:
		print_debug("tentativa de aumentar o hp com um valor negativo")
	else:
		if value+current_hp>max_hp:
			current_hp=max_hp
		else:
			current_hp+=value
		if get_parent().is_in_group("player"):
			GameController.current_hp = current_hp


func increase_max_hp(value:int):
	if value<0:
		print_debug("tentativa de aumentar o hp maximo por um valor negativo")
	else:
		max_hp+=value
		current_hp+=value
		if get_parent().is_in_group("player"):
			GameController.current_hp = current_hp
			GameController.max_hp = max_hp


func reset_hp():
	current_hp=0


func is_empty() -> bool:
	return current_hp == 0
