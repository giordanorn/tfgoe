extends Node2D
var history = {
	0: "    O mundo de Etrata viveu muitos anos em guerra, pois a superfície do mundo havia sido tomada em maldições, e orcs, mortos-vivos e demônios espalhavam-se pelo mundo e devoravam os povos humanoides.A população foi rapidamente tomada pelo medo, pois os aventureiros comuns não conseguiam dar conta dessas ameaças.\n    Após muitos séculos sendo oprimidos pelas forças malignas, as 3 maiores nações firmaram um plano, e seus líderes bélicos, o arquimago Szadek, a paladina Paladia e o líder de inteligência Salazar encarregaram-se de atrair as criaturas para uma armadilha e selá-las no subsolo através de uma barreira mágica reforçada com energia divina.\n    O local do selo tornou-se conhecido como Portão de Etrata, e o ocorrido ficou conhecido como Aliança de Etrata, a qual proporcionou paz e prosperidade para os reinos por várias gerações. Os guerreiros responsáveis pela execução do plano ficaram juntos ao selo para protegê-lo pela eternidade e manter o mal preso. No entanto, após centenas de anos, o selo, já esquecido, enfraqueceu, e os campeões desapareceram sem deixar rastros.\n    A Aliança de Etrata foi, mais uma vez, convocada, e os países enviaram seus campeões para selar novamente a fenda para o submundo.",
	1: "    Chegando à fenda, você depara-se com o pior dos casos: a área parece ter sido tomada por orcs, criaturas que serviam os antigos demônios, caóticas e sem apreço por nada, exceto ouro, poder e vilolência.\n    Após algumas momentos de combate, você atravessa as barreiras iniciais nos arredores do castelo, aparentemente tomadas por orcs. Suas defesas ainda estão em formação e é relativamente simples chegar às camadas mais internas da fortificação através de pura força bruta.\n    Infiltrando-se pelas florestas externas, você começa a aproximar-se da muralha que cercava o castelo do selo, e depara-se com algo inesperado: orcs capazes de conjurar mágicas, e inteligentes o suficiente para comandar lacaios.\n    Talvez o tempo que estas criaturas passaram no submundo as tenha ensinado a agrupar-se, o que é extremamente preocupante...",
	2: "    Indo ainda mais fundo nas bases inimigas, você percebe que existem diversas mentes controlando os orcs, não se resumindo apenas aos xamãs, dito que os padrões de movimento destas criaturas diverge drasticamente de qualquer coisa que você ja tenha visto orcs fazerem. Estas criaturas de natureza bizarra e desorganizada estão, de alguma forma, construindo ordens hierárquicas entre si, algo muito raramente visto, e que indica uma de duas coisas: ou estão sob controle de um poder infinitamente maior que o próprio ou estão, de fato, se tornando mais inteligentes.\n    Refletindo sobre isto, enquanto observa mais ao fundo na fortificação, agora já se estruturando de maneira mais organizada, é possível notar uma criatura bizarra, de aparência definitivamente antinatural.\n    Um orc gigantesco, capaz de gerar outros de si através de sua própria carne, que regenera-se logo após ser removida.\n    A criatura não parece possuir nenhum tipo de inteligência, e suas ações indicam que foi treinada para guardar este portão. Com certeza algo relevante encontra-se dentro da fortaleza, e é seu dever descobrir o quê.",
	}

var current_text = 0

func _ready():
	current_text = GameController.current_stage-1
	$HUD/Control/Label.text=history[current_text]


func _process(delta):
	if current_text == 0:
		get_node("HUD/Control/Buttons/Previous").set_disabled(true)
	elif get_node("HUD/Control/Buttons/Previous").disabled:
		get_node("HUD/Control/Buttons/Previous").set_disabled(false)
	if current_text == GameController.current_stage-1:
		get_node("HUD/Control/Buttons/Next").set_disabled(true)
	elif get_node("HUD/Control/Buttons/Next").disabled:
		get_node("HUD/Control/Buttons/Next").set_disabled(false)


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
