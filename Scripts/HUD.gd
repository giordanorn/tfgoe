extends MarginContainer

onready var character = get_parent()
onready var game_info = get_node("/root/GameController")

func update_hp_bar():
	$HBoxContainer/Bars/Gauge.max_value = character.get_node("Health").max_hp
	$HBoxContainer/Bars/Gauge.value = character.get_node("Health").current_hp

func update_exp():
	$HBoxContainer/Bars/Bar/Count/Background/Number.text = str(game_info.xp)

func _process(delta):
	update_exp()
	update_hp_bar()