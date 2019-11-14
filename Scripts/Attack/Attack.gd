extends Node

var strength = 0

func _on_HitArea_body_entered(body):
	print ("opa um maluco entrou aqui")
	print (body)
	
	# here it should try cause damage to de body
	# body.take_damage(strength)
	# maybe it should filter the bodies, like being just enemies instead of any body
	# if body.is_an_enemy:
