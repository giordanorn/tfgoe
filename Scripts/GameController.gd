extends Node2D

enum PLAYER_CHARACTER {
	WIZARD = 0,
	KNIGHT = 1,
	ELF = 2
}

var current_stage = 1
export (int) var total_score = 0
export (int) var xp = 0
export var selected_character = PLAYER_CHARACTER.ELF

export (bool) var evolving = false
export (bool) var starting_stats_defined = false
export (int) var current_hp = 0
export (Dictionary) var max_hp = {"value":0,"cost":1}
export (Dictionary) var current_mspd = {"value":0,"cost":1}
export (Dictionary) var current_aspd = {"value":0,"cost":1}
export (Dictionary) var current_damage = {"value":0,"cost":1}

"""
Aqui devem ser guardadas as variáveis globais jogo.
"""
