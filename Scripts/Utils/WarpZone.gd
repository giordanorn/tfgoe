extends Node2D

export(String, FILE) var scene_path

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_EffectArea_body_entered(body):
	"""
	Muda a cena para `scene_path`
	"""
	get_tree().change_scene(scene_path)
