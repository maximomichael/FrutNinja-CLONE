extends Node2D

var frutsList = []
var grups = []

func _ready():
	for list in get_children():
		frutsList.append(list)
	generater()
	
 
	grups.connect("DestroyFrut", self, "destroy")

func generater():
	var value = int(rand_range(0, frutsList.size()-1))
	frutsList[value].visible = true
	
func destroy():
	queue_free()
