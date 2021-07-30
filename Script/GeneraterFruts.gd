extends Node2D

onready var fruts = [
	preload("res://Scenes/Frut.tscn"),
	preload("res://Scenes/Bomb.tscn")
] 

var set_bomb = 0
var indexFrut = 0

func _ready():
	randomize()
	set_bomb = int(rand_range(5, 10))
	while true:
		if set_bomb <= 0:
			indexFrut = 1
			set_bomb = int(rand_range(5, 20))
		else:
			indexFrut = 0
			set_bomb -= 1
			
		var frut = fruts[indexFrut].instance()
		frut.transform.origin.x = int(rand_range(400, 800))
		yield(get_tree().create_timer(rand_range(.8, 1.6)), "timeout")
		add_child(frut)
