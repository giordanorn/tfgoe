extends Node2D

func _on_Exit_button_up():
	get_tree().quit()


func _on_Menu_button_up():
	get_tree().change_scene("res://States/Main Menu.tscn")
