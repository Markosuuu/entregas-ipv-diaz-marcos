class_name Bala
extends Area2D

signal eliminar_bala(bala)

@export var speed: float
@onready var notifier: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

var direccion: Vector2

func _ready() -> void:
	set_physics_process(false)
	body_entered.connect(_on_collision)
	notifier.screen_exited.connect(_on_visible_on_screen_notifier_2d_screen_exited)

func set_posicion_arranque(posicion: Vector2, direccion_arranque: Vector2):
	global_position = posicion
	self.direccion = direccion_arranque
	set_physics_process(true)

func _physics_process(delta: float) -> void:
	position += direccion * speed * delta

func _on_collision(_nodo: Node2D):
	_remove.call_deferred()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	_remove.call_deferred()

func _remove() -> void:
	set_physics_process(false)
	emit_signal("eliminar_bala", self)
