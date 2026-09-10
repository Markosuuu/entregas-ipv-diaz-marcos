extends Sprite2D

@onready var timer: Timer = $Timer
@onready var posicion_disparo_torreta: Marker2D = $PosicionDisparoTorreta
@onready var where_player: RayCast2D = $WhereIsPlayer

@export var bala_escena: PackedScene

var player: Node2D
var contenedor_bala: Node

func initialize(posicion: Vector2, container: Node) -> void:
	global_position = posicion
	set_valores(container)

func set_valores(container):
	self.contenedor_bala = container
	timer.start()

func _on_timer_timeout() -> void:
	disparar()

func disparar():
	if player != null:
		
		where_player.target_position = to_local(player.global_position)
		where_player.force_raycast_update()
		
		if where_player.is_colliding():
			var collider = where_player.get_collider()
			if collider is Player:
				var bala_instance: Bala = bala_escena.instantiate()
				contenedor_bala.add_child(bala_instance)
				bala_instance.set_posicion_arranque(posicion_disparo_torreta.global_position, (player.global_position - posicion_disparo_torreta.global_position).normalized())
				bala_instance.eliminar_bala.connect(_on_eliminar_bala)

func _on_eliminar_bala(bala: Bala) -> void:
	contenedor_bala.remove_child(bala)
	bala.queue_free()
	
func _on_zona_de_disparo_body_entered(body: Node2D) -> void:
	player = body


func _on_zona_de_disparo_body_exited(body: Node2D) -> void:
	if body == player:
		player = null
