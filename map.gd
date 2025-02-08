extends Node3D

@onready var Network: Node = $Network
var player_scene: PackedScene = preload("res://Player.tscn")

func _ready() -> void:
	Lobby.player_loaded.rpc_id(1)
	
func start_game():
	if DisplayServer.get_name() != "headless":
		_spawn_player(1)
		
	for id in multiplayer.get_peers():
		print("spawn player")
		_spawn_player(id)
		
		
func _spawn_player(id: int):
	var player: CharacterBody3D = player_scene.instantiate()
	player.name = str(id)
	player.position = Vector3(10, randi()%5, 10)
	Network.add_child(player)
