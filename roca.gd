extends RigidBody2D

export (int) var vel_min
export (int) var vel_max

var tipo_roca = ["marron", "gris"]

func _ready():
	$AnimatedSprite.animation = tipo_roca[randi() % tipo_roca.size()]

func _on_visivility_screen_exited():
	queue_free()
