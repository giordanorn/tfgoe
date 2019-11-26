extends Node2D

onready var game_info = get_node("/root/GameController")

func _process(delta):
	if game_info.xp<game_info.current_aspd["cost"]:
		get_node("HUD/Menu/Bars/ASPDContainer/ASPDButton").set_disabled(true)
	if game_info.xp<game_info.current_mspd["cost"]:
		get_node("HUD/Menu/Bars/MSPDContainer/MSPDButton").set_disabled(true)
	if game_info.xp<game_info.max_hp["cost"]:
		get_node("HUD/Menu/Bars/HealthContainer/HealthButton").set_disabled(true)
	if game_info.xp<game_info.current_damage["cost"]:
		get_node("HUD/Menu/Bars/DamageContainer/DamageButton").set_disabled(true)
	pass

func _on_DamageButton_button_up():
	game_info.current_damage["value"]+=int(game_info.current_damage["value"]/10)+1
	game_info.xp-=game_info.current_damage["cost"]
	game_info.current_damage["cost"]+=1
	game_info.evolving = true

func _on_HealthButton_button_up():
	game_info.current_hp+=int(game_info.max_hp["value"]/10)+1
	game_info.max_hp["value"]+=int(game_info.max_hp["value"]/10)+1
	game_info.xp-=game_info.max_hp["cost"]
	game_info.max_hp["cost"]+=1
	game_info.evolving = true

func _on_ASPDButton_button_up():
	game_info.current_aspd["value"]-=0.02
	game_info.xp-=game_info.current_aspd["cost"]
	game_info.current_aspd["cost"]+=1
	game_info.evolving = true

func _on_MSPDButton_button_up():
	game_info.current_mspd["value"]+=10
	game_info.xp-=game_info.current_mspd["cost"]
	game_info.current_mspd["cost"]+=1
	game_info.evolving = true
