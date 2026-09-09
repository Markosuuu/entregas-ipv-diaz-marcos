extends Node

func _ready() -> void:
	$Player.set_contenedor_balas(self)
	$Torreta.set_valores(self)
