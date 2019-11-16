extends Node

export var strength = 0
export var animation_time = 0.5
export var cooldown = 1

onready var hit_area = $HitArea

func _ready():
	# inicia o jogo sem que esteja atacando, ie, remove o nó de ataque
	stop_attacking()

func _process(delta):
	if attack_button_pressed() && !is_in_cooldown():
		attack()

func attack_button_pressed() -> bool:
	# está como padrão a tecla de "ui_accept"
	# é possivel alterar para outra tecla ou até deixar algo parametrizável
	return Input.is_action_just_pressed("ui_accept")

func is_in_cooldown() -> bool:
	# TODO
	# essa função deve retornar true caso o ataque esteja em cooldown e falso caso contrário
	# está sempre retornando falso podermos testar enquanto ainda nao foi implementato
	return false
	
func attack():
	# insere o nó da area de hit
	add_child(hit_area)
	# inicia o cooldown da animação do ataque
	$AnimationCooldown.start(animation_time)
	
func stop_attacking():
	# remove o nó que segura a área de hit
	remove_child(hit_area)

func is_hitting() -> bool:
	return !$AnimationCooldown.is_stopped()

func _on_HitArea_body_entered(body):
	if body.is_in_group("enemy"):
		# tecnicas avançadas de debug
		print ("opa um maluco entrou aqui")
		print (body)
		# deve causar dano ao body
		# assumindo que o método take_damage está implementado
		# deve aparecer algo como:
		# body.take_damage(strength)

func _on_AnimationCooldown_timeout():
	stop_attacking()
	pass