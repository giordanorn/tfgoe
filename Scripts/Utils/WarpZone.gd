extends Node2D

export(String, FILE) var scene_path


func _on_Area2D_body_entered(body):
	"""
	Muda a cena para `scene_path`
	"""
	if body.is_in_group("player"):
		GameController.evolving = true
		GameController.current_stage+=1
		get_tree().change_scene("res://States/Lore.tscn")
