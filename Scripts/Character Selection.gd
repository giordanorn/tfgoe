extends Node2D

onready var game_info = get_node("/root/GameController")

func _on_Knight_button_up():
	game_info.selected_character = 1
	get_tree().change_scene("res://States/Stages/Forest/Stage1.tscn")

func _on_Elf_button_up():
	game_info.selected_character = 2
	get_tree().change_scene("res://States/Stages/Forest/Stage1.tscn")

func _on_Wizard_button_up():
	game_info.selected_character = 0
	get_tree().change_scene("res://States/Stages/Forest/Stage1.tscn")
