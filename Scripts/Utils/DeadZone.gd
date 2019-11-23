extends Node2D

func _on_EffectArea_body_entered(body):
	if body.is_in_group("player") or body.is_in_group("enemy"):
		body.rip()
