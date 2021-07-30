extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var x = [-2,-1,1,2]
	var directionBomb = randi() % x.size()
	apply_impulse(Vector2(0, 0), Vector2(x[directionBomb] * 50, rand_range(-400,-450)))


func cutBomb():
	GameControl.kill()
	queue_free()
