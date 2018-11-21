extends Node

export (PackedScene) var Roca
var score

func _ready():
	randomize()
	
func new_game():
	score = 0
	$Player.inicio($PosicionInicial.position);
	$Joystick.inicio();
	$InicioTimer.start()
	$Interfaz.show_message("Ready!")
	$Interfaz.update_score(score)

func game_over():
	$ScoreTimer.stop()
	$RocaTimer.stop()
	$Interfaz.game_over()
	$Joystick.game_over()


func _on_InicioTimer_timeout():
	$RocaTimer.start()
	$ScoreTimer.start()


func _on_ScoreTimer_timeout():
	score += 1
	$Interfaz.update_score(score)
	pass


func _on_RocaTimer_timeout():
	$PasilloEntrada/PositionRoca.set_offset(randi())
	var R = Roca.instance()
	add_child(R)
	var direction = $PasilloEntrada/PositionRoca.rotation  + (PI / 2)
	R.position = $PasilloEntrada/PositionRoca.position
	direction += rand_range(-PI/4, PI/4)
	R.rotation = direction
	R.set_linear_velocity(Vector2(rand_range(R.vel_min, R.vel_max), 0).rotated(direction))
