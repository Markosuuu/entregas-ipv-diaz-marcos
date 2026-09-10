extends Node

@onready var player: Node2D = $Player
@onready var torreta_spawner: Node = $SpawnerTorretas

func _ready() -> void:
	player.set_contenedor_balas(self)
	torreta_spawner.initialize(player)
