extends Node

var score = 0
var life = 3

signal UpHUD()
signal UpKillHUD()

func newScore():
	score += 1
	emit_signal("UpHUD")
	
func kill():
	if life > 0:
		emit_signal("UpKillHUD")
		life -= 1
		if life <= 0:
			get_tree().paused = true
			emit_signal("UpKillHUD")
			life = 3
			score = 0
		
