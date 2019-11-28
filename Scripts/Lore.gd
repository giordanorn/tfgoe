extends Node2D
var history = {
	0: "    O mundo de Etrata viveu muitos anos em guerra, pois a superfície do mundo havia sido tomada em maldições, e orcs, mortos-vivos e demônios espalhavam-se pelo mundo e devoravam os povos humanoides.A população foi rapidamente tomada pelo medo, pois os aventureiros comuns não conseguiam dar conta dessas ameaças.\n    Após muitos séculos sendo oprimidos pelas forças malignas, as 3 maiores nações firmaram um plano, e seus líderes bélicos, o arquimago Szadek, a paladina Paladia e o líder de inteligência Salazar encarregaram-se de atrair as criaturas para uma armadilha e selá-las no subsolo através de uma barreira mágica reforçada com energia divina.\n    O local do selo tornou-se conhecido como Portão de Etrata, e o ocorrido ficou conhecido como Aliança de Etrata, a qual proporcionou paz e prosperidade para os reinos por várias gerações. Os guerreiros responsáveis pela execução do plano ficaram juntos ao selo para protegê-lo pela eternidade e manter o mal preso. No entanto, após centenas de anos, o selo, já esquecido, enfraqueceu, e os campeões desapareceram sem deixar rastros.\n    A Aliança de Etrata foi, mais uma vez, convocada, e os países enviaram seus campeões para selar novamente a fenda para o submundo.",
	1: "",
	2: "",
	3: ""
	}

var current_text = 0

func _ready():
	current_text = GameController.current_stage-1
	$HUD/Control/Label.text=history[current_text]


func _process(delta):
	if current_text == 0:
		get_node("HUD/Control/Previous").set_disabled(true)
	elif get_node("HUD/Control/Previous").disabled:
		get_node("HUD/Control/Previous").set_disabled(false)
	if current_text == GameController.current_stage-1:
		get_node("HUD/Control/Next").set_disabled(true)
	elif get_node("HUD/Control/Next").disabled:
		get_node("HUD/Control/Next").set_disabled(false)


func _on_Next_button_up():
	current_text += 1
	get_node("HUD/Control/Label").text = history[current_text]


func _on_Previous_button_up():
	current_text -= 1
	get_node("HUD/Control/Label").text = history[current_text]


func _on_NextStage_button_up():
	if !GameController.starting_stats_defined:
		get_tree().change_scene("res://States/Character Selection.tscn")
	else:
		get_tree().change_scene("res://States/Checkpoint.tscn") 
