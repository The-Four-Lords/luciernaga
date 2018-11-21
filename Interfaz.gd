extends CanvasLayer

signal iniciar_juego

func show_message(message):
	$MensajeLabel.text = message
	$MensajeLabel.show()
	$MensajeTimer.start()
	
func game_over():
	show_message("Game Over")
	yield($MensajeTimer, "timeout")
	$ButtonPlay.show()
	$ButtonExit.show()
	$MensajeLabel.text = "mars"
	$MensajeLabel.show()
	
func update_score(score):
	$ScoreLabel.text = str(score)

func _on_MensajeTimer_timeout():
	$MensajeLabel.hide()

func _on_ButtonPlay_pressed():
	$ButtonPlay.hide()
	$ButtonExit.hide()
	emit_signal("iniciar_juego")

func _on_ButtonPlay2_pressed():
	get_tree().quit()
