extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var pressedTouch = false
var pointInt = Vector2(0, 0)
var pointDrag = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false
	set_process_input(true)
	set_physics_process(true)

func _physics_process(delta):
	update()
	
	
	#if pointInt.distance_squared_to(pointDrag) > 7000:
	if pressedTouch:
		var spaceState = get_world_2d().direct_space_state
		var value = spaceState.intersect_ray(pointInt, pointDrag)
		LimitPress(pointDrag)
		if not value.empty():
			if value.collider.has_method("cutFrut"):
				 value.collider.cutFrut()
			elif value.collider.has_method("cutBomb"):
				value.collider.cutBomb()
		
	
func _input(event):
	event = make_input_local(event)

	if event is InputEventScreenTouch:
		if event.is_pressed():
			pointInt = event.position
			pressedTouch = true
		else:
			pointInt = Vector2()
			pointDrag =  Vector2()
			pressedTouch = false
		
	if pressedTouch:
		pointDrag = event.position		
		pass

func LimitPress(value):
	var pointNew = value
	yield(get_tree().create_timer(.03), "timeout")
	if pressedTouch:
		pointInt = pointNew
	
func _on_TimerLimitPress_timeout():
	pointInt = Vector2()
	pointDrag =  Vector2()
	pressedTouch = false
	
func _draw():
	draw_line(pointInt, pointDrag, Color(1, 0, 0), 10.0)
