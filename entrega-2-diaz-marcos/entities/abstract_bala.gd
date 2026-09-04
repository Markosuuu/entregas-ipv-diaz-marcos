extends Sprite2D
class_name Bala

signal eliminar_bala(bala)

@export var speed: float
@onready var timer = $Timer

var direccion: Vector2

func _ready() -> void:
	set_physics_process(false)
	timer.timeout.connect(_on_timer_timeout)

func set_posicion_arranque(posicion: Vector2, direccion: Vector2):
	global_position = posicion
	self.direccion = direccion
	timer.start()
	set_physics_process(true)

func _physics_process(delta: float) -> void:
	position += direccion * speed * delta

func _on_timer_timeout() -> void:
	emit_signal("eliminar_bala", self)
