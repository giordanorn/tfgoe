extends MarginContainer

onready var character = get_parent()

func update_hp_bar():
	$HBoxContainer/Bars/Gauge.max_value = character.get_node("Health").max_hp
	$HBoxContainer/Bars/Gauge.value = character.get_node("Health").current_hp


func update_exp():
	$HBoxContainer/Bars/Bar/Count/Background/Number.text = str(GameController.xp)


func _process(delta):
	update_exp()
	update_hp_bar()