extends CanvasLayer

onready var labelScore = get_node("LabelScore")
onready var gameOver = get_node("LabelGameOver")

func _ready():
	updateHUD()
	GameControl.connect("UpHUD", self, "updateHUD")
	GameControl.connect("UpKillHUD", self, "updateKillHUD")


func updateHUD():
	labelScore.text = str(GameControl.score)


func updateKillHUD():
	if(GameControl.life > 0):
		get_node("Life_0" + str(GameControl.life)).set_modulate(Color(1, 0, 0))
	else:
		gameOver.visible = true
