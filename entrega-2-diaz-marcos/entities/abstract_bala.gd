extends Sprite2D
class_name Bala

var direccion: Vector2

func _ready() -> void:
	set_physics_process(false)

func set_posicion_arranque(posicion: Vector2, direccion: Vector2):
	global_position = posicion
	self.direccion = direccion
	set_physics_process(true)

func _physics_process(delta: float) -> void:
	position += direccion * 500 * delta
	
