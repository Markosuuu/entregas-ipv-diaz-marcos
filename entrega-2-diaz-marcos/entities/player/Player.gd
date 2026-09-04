extends Sprite2D

@onready var canion:Sprite2D = $Canion

var speed = 200 #Pixeles

var contenedor_balas: Node

func set_contenedor_balas(container: Node):
	canion.contenedor_balas = container
	contenedor_balas = container

func _physics_process(delta):
	
	var posicion_mouse:Vector2 = get_global_mouse_position()
	canion.look_at(posicion_mouse)
	
	if Input.is_action_just_pressed("disparar"):
		canion.disparar()
	
	# Manera optimizada
	var direction_optimized:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	position.x += direction_optimized * speed * delta
