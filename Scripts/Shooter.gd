extends Node2D

export(String, FILE) var character: = ""
export var waiting_time: = 5.0
export var active_spawning_interval: = 0.1
export var quantity: = 1

var waiting
var spawn

var current_spawning: = 0

const SCENE_PATH = "res://Utils/FireBall.tscn"

func _ready() -> void:
	waiting = Timer.new()
	add_child(waiting)
	waiting.connect("timeout", self, "on_waiting_timeout")
	waiting.start(waiting_time)
	
	spawn = Timer.new()
	add_child(spawn)
	spawn.connect("timeout", self, "on_spawn_timeout")


func on_waiting_timeout() -> void:
	spawn.start(active_spawning_interval)


func on_spawn_timeout() -> void:
	var node = preload(SCENE_PATH).instance()
	add_child(node) 
	print ("inserindo no")
	current_spawning += 1
	if current_spawning >= quantity:
		spawn.stop()
		current_spawning = 0
