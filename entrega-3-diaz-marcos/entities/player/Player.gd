class_name Player
extends CharacterBody2D

@onready var canion:Sprite2D = $Canion

@export var ACELERACION: float = 20.0
@export var VELOCIDAD_LIMITE: float = 600.0
@export var FRICCION: float = 0.1
@export var DISTANCIA_SALTO: float = 100
@export var GRAVEDAD: float = 2

#var velocidad: Vector2 = Vector2.ZERO
var contenedor_balas: Node

func set_contenedor_balas(container: Node):
	self.contenedor_balas = container
	canion.contenedor_balas = container

func _get_inputs():
	# Dirección del cañón
	var posicion_mouse:Vector2 = get_global_mouse_position()
	canion.look_at(posicion_mouse)
	
	# Disparar
	if Input.is_action_just_pressed("disparar"):
		canion.disparar()
	
	# Moverse
	var direccion_del_movimiento:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	if direccion_del_movimiento != 0:
		velocity.x = clamp(velocity.x + (direccion_del_movimiento * ACELERACION), -VELOCIDAD_LIMITE, VELOCIDAD_LIMITE)
	else:
		velocity.x = lerp(velocity.x, 0.0, FRICCION) if abs(velocity.x) > 1.0 else 0.0
	
	# Saltar
	
	if Input.is_action_just_pressed("Saltar"):
		velocity.y += -DISTANCIA_SALTO
	

func _physics_process(delta):
	_get_inputs()
	velocity.y += GRAVEDAD
	self.move_and_slide()
