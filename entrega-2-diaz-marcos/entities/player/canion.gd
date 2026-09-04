extends Sprite2D

@onready var posicion_disparo: Marker2D = $PosicionDisparo

@export var bala_escena: PackedScene

var contenedor_balas:Node

func disparar(vector):
	var bala_instance: Bala = bala_escena.instantiate()
	contenedor_balas.add_child(bala_instance)
	bala_instance.set_posicion_arranque(
		posicion_disparo.global_position,
		(posicion_disparo.global_position - global_position).normalized())
