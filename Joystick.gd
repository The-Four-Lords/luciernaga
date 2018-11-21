extends CanvasLayer

var stick_speed = 0
var stick_angle = 0
var stick_vector = Vector2()

func _ready():
	game_over()

func game_over():
	$BigCircle.hide()
	$BigCircle/SmallCircle.hide()
	
func inicio():
	$BigCircle.show()
	$BigCircle/SmallCircle.show()