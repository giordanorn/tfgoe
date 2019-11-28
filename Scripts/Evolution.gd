extends Node2D


func update_text():
	$HUD/Menu/Bars/ASPDContainer/ASPDLabel.text = "Current value: "+str(GameController.current_aspd["value"])+"\nCost to Evolve: "+str(GameController.current_aspd["cost"])
	$HUD/Menu/Bars/MSPDContainer/MSPDLabel.text = "Current value: "+str(GameController.current_mspd["value"])+"\nCost to Evolve: "+str(GameController.current_mspd["cost"])
	$HUD/Menu/Bars/DamageContainer/DamageLabel.text = "Current value: "+str(GameController.current_damage["value"])+"\nCost to evolve: "+str(GameController.current_damage["cost"])
	$HUD/Menu/Bars/HealthContainer/HealthLabel.text = "Current value: "+str(GameController.max_hp["value"])+"\nCost do Evolve: "+str(GameController.max_hp["cost"])


func _ready():
	update_text()


func _process(delta):
	if GameController.xp<GameController.current_aspd["cost"]:
		get_node("HUD/Menu/Bars/ASPDContainer/ASPDButton").set_disabled(true)
	if GameController.xp<GameController.current_mspd["cost"]:
		get_node("HUD/Menu/Bars/MSPDContainer/MSPDButton").set_disabled(true)
	if GameController.xp<GameController.max_hp["cost"]:
		get_node("HUD/Menu/Bars/HealthContainer/HealthButton").set_disabled(true)
	if GameController.xp<GameController.current_damage["cost"]:
		get_node("HUD/Menu/Bars/DamageContainer/DamageButton").set_disabled(true)


func _on_DamageButton_button_up():
	GameController.current_damage["value"]+=int(GameController.current_damage["value"]/5)+1
	GameController.xp-=GameController.current_damage["cost"]
	GameController.current_damage["cost"]+=1
	update_text()


func _on_HealthButton_button_up():
	GameController.current_hp+=int(GameController.max_hp["value"]/10)+1
	GameController.max_hp["value"]+=int(GameController.max_hp["value"]/10)+1
	GameController.xp-=GameController.max_hp["cost"]
	GameController.max_hp["cost"]+=1
	update_text()


func _on_ASPDButton_button_up():
	GameController.current_aspd["value"]-=0.02
	GameController.xp-=GameController.current_aspd["cost"]
	GameController.current_aspd["cost"]+=1
	update_text()


func _on_MSPDButton_button_up():
	GameController.current_mspd["value"]+=10
	GameController.xp-=GameController.current_mspd["cost"]
	GameController.current_mspd["cost"]+=1
	update_text()


func _on_Button_button_up():
	if GameController.current_stage>3:
		get_tree().change_scene("res://States/Game Over.tscn")
	else:
		get_tree().change_scene("res://States/Stages/Forest/Stage"+str(GameController.current_stage)+".tscn")
