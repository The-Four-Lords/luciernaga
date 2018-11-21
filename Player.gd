extends Area2D
export (int) var velocity = 20
var movement = Vector2()
var limite
signal golpe

func _ready():
	hide()
	limite = get_viewport_rect().size

func _process(delta):
	#move_player_arrow_keys(delta)
	move_player_virtual_stick(delta)
	
func move_player_virtual_stick(delta):
	position += get_node("../Joystick").stick_vector * get_node("../Joystick").stick_speed * velocity * delta
	position.x = clamp(position.x, 0, limite.x)
	position.y = clamp(position.y, 0, limite.y)
	

func move_player_arrow_keys(delta):
	movement = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		movement.x += 1
	if Input.is_action_pressed("ui_left"):
		movement.x -= 1
	if Input.is_action_pressed("ui_down"):
		movement.y += 1
	if Input.is_action_pressed("ui_up"):
		movement.y -= 1
	
	if movement.length() > 0:
		movement =  movement.normalized() * velocity
		
	position += movement * delta
	position.x = clamp(position.x, 0, limite.x)
	position.y = clamp(position.y, 0, limite.y)

	if movement.y > 0:
		$fire.animation = "Down"
	elif movement.y < 0:
		$fire.animation = "Up"
	else:
		$fire.animation = "Cruise"


	

func _on_Player_body_entered(body):
	hide()
	emit_signal("golpe")
	$CollisionShape2D.disabled = true
	
func inicio(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
