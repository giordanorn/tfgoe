extends Node2D

var character

func _ready():
	if GameController.selected_character == 2:
		character = load("res://Characters/Players/Elf.tscn") as PackedScene
	elif GameController.selected_character == 1:
		character = load("res://Characters/Players/Knight.tscn") as PackedScene
	elif GameController.selected_character == 0:
		character = load("res://Characters/Players/Wizard.tscn") as PackedScene
	else:
		print("invalid character choice")
	character=character.instance()
	self.add_child(character)
	character.position = Vector2(16,70)