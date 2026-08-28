extends Sprite2D

func _process(_delta):
	if Input.is_action_pressed("mover_izq"):
		position.x -= 5
	if Input.is_action_pressed("mover_der"):
		position.x += 5
