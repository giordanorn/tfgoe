extends Node2D

func _on_Knight_button_up():
	GameController.selected_character = 1
	get_tree().change_scene("res://States/Stages/Forest/Stage1.tscn")

func _on_Elf_button_up():
	GameController.selected_character = 2
	get_tree().change_scene("res://States/Stages/Forest/Stage1.tscn")

func _on_Wizard_button_up():
	GameController.selected_character = 0
	get_tree().change_scene("res://States/Stages/Forest/Stage1.tscn")
