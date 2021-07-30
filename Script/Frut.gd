extends RigidBody2D

onready var spriteFrut = get_node("SpriteInt")
onready var spriteLeft = get_node("RBLeft/SpriteLeft")
onready var spriteRight = get_node("RBRight/SpriteRight")
onready var colliderFrut = get_node("CollisionFruts")

onready var leftRB = get_node("RBLeft")
onready var rightRB = get_node("RBRight")

onready var spritesFruts = [
	load("res://Assets/Fruts/Banana_Idle0001.png"),
	load("res://Assets/Fruts/Avocado_Idle0001.png"),
	load("res://Assets/Fruts/Lemon_Idle0001.png"),
	load("res://Assets/Fruts/Orange_Idle0001.png"),
	load("res://Assets/Fruts/Pear_Idle0001.png"),
	load("res://Assets/Fruts/PineApple_Idle0001.png"),
	load("res://Assets/Fruts/Tomato_Idle0001.png"),
	load("res://Assets/Fruts/Watermelon_Idle0001.png")
]

var blockCkick = false

func _ready():
	randomize()
	var x = [-2,-1,1,2]
	var directionFrut = randi() % x.size()
	apply_impulse(Vector2(0, 0), Vector2(x[directionFrut] * 50, rand_range(-400,-450)))
	var value = int(rand_range(0, spritesFruts.size()))
	spriteFrut.texture = spritesFruts[value]
	spriteLeft.texture = spritesFruts[value]
	spriteRight.texture = spritesFruts[value]

func _process(delta):
	if global_transform.origin.y > 900:
		GameControl.kill()
		queue_free()

	if leftRB.global_transform.origin.y > 900 and rightRB.global_transform.origin.y > 900:
		queue_free()

func cutFrut():

	if !blockCkick:
		GameControl.newScore()	
		colliderFrut.disabled = true
		spriteFrut.queue_free()
		
		set_mode(1)
		
		leftRB.set_mode(0)
		rightRB.set_mode(0)
			
		leftRB.apply_impulse(Vector2(0, 0), Vector2(rand_range(-20, -40), 0))
		rightRB.apply_impulse(Vector2(0, 0), Vector2(rand_range(40, 60), -100))	

	blockCkick = true
