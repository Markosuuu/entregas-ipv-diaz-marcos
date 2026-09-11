class_name Bala
extends Area2D

signal eliminar_bala(bala)

@export var speed: float
@onready var timer = $Timer

var direccion: Vector2

func _ready() -> void:
	set_physics_process(false)
	timer.timeout.connect(_on_timer_timeout)
	body_entered.connect(_on_collision)

func set_posicion_arranque(posicion: Vector2, direccion_arranque: Vector2):
	global_position = posicion
	self.direccion = direccion_arranque
	timer.start()
	set_physics_process(true)

func _physics_process(delta: float) -> void:
	position += direccion * speed * delta

func _on_timer_timeout() -> void:
	emit_signal("eliminar_bala", self)

func _on_collision(_nodo: Node2D):
	_remove.call_deferred()
	
func _remove():
	get_parent().remove_child(self)
	queue_free()
