extends MarginContainer

var player_scene: Resource = load("res://Player.tscn")

var tab_container : TabContainer

func _ready() -> void:
	tab_container = $TabContainer
	Lobby.add_new_username.connect(_add_new_username)

func _on_exit_button_pressed() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()


func _on_enter_game_button_pressed() -> void:
	tab_container.current_tab = 3


func _on_server_pressed() -> void:
	tab_container.current_tab = 2


func _on_lan_pressed() -> void:
	tab_container.current_tab = 1


func _on_host_button_pressed() -> void:
	tab_container.current_tab = 2
	Lobby.create_game()
	_add_new_username(str(Lobby.multiplayer.get_unique_id()))


func _on_join_button_pressed() -> void:
	tab_container.current_tab = 2
	var ip_str = $TabContainer/LAN/VBoxContainer/IPInputBox.text
	print(ip_str)
	Lobby.join_game(ip_str)
	Lobby.player_loaded.rpc_id(1) # Tell the server that this peer has loaded.
	_add_new_username(str(Lobby.multiplayer.get_unique_id()))

func _add_new_username(username: String):
	var player_list: ItemList = $TabContainer/Lobby/HSplitContainer/PlayerViewer/PlayerList
	print("player_list: ",player_list)
	player_list.add_item(username)

func _on_lan_back_button_pressed() -> void:
	tab_container.current_tab = 3


func _on_lobby_back_button_pressed() -> void:
	tab_container.current_tab = 1


func _on_enter_name_back_button_pressed() -> void:
	tab_container.current_tab = 0

func _spawn_player():
	var p: CharacterBody3D = player_scene.instantiate()
	p.set_pos(Vector3(10,10,10))
	var netowrk_node = $"/root/Game/Network"
	netowrk_node.add_child(p)
	print("network node: ",netowrk_node)
	hide()
	print(Lobby.multiplayer.get_unique_id()," intantiated player")

func _on_start_button_pressed() -> void:
	#TODO: only host can start the game 
	# and needs to signal all clients that we have started
	if multiplayer.is_server():
		_spawn_player()
		_recived_rpc.rpc()

@rpc("any_peer")
func _recived_rpc():
	print("recived_rpc")
	_spawn_player()
