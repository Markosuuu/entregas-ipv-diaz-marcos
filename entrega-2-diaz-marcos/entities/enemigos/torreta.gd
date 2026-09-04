extends Sprite2D

var player
@export var bala_escena: PackedScene
var contenedor_bala: Node

@onready var posicion_disparo_torreta: Marker2D = $PosicionDisparoTorreta

func set_valores(player, container):
	self.player = player
	self.contenedor_bala = container
	$Timer.start()

func _on_timer_timeout() -> void:
	disparar()

func disparar():
	var bala_instance: Bala = bala_escena.instantiate()
	contenedor_bala.add_child(bala_instance)
	bala_instance.set_posicion_arranque(posicion_disparo_torreta.global_position, (player.global_position - posicion_disparo_torreta.global_position).normalized())
	bala_instance.eliminar_bala.connect(_on_eliminar_bala)

func _on_eliminar_bala(bala: Bala) -> void:
	contenedor_bala.remove_child(bala)
	bala.queue_free()
