extends Node2D

export(String, FILE) var start_scene
export(String, FILE) var test_scene


func _on_Exit_button_up():
	"""
	Sai do jogo
	"""
	get_tree().quit()

func _on_Test_button_up():
	"""
	Inicia a cena de testes
	"""
	get_tree().change_scene(test_scene)

func _on_Start_button_up():
	"""
	Inicia o jogo
	"""
	get_tree().change_scene(start_scene)
