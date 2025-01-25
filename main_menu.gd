extends MarginContainer


var tab_container : TabContainer

func _ready() -> void:
	tab_container = $TabContainer

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
	


func _on_join_button_pressed() -> void:
	tab_container.current_tab = 2
	Lobby.join_game($TabContainer/LAN/VBoxContainer/IPInputBox.text)
	Lobby.player_loaded.rpc_id(1) # Tell the server that this peer has loaded.



func _on_lan_back_button_pressed() -> void:
	tab_container.current_tab = 3


func _on_lobby_back_button_pressed() -> void:
	tab_container.current_tab = 1


func _on_enter_name_back_button_pressed() -> void:
	tab_container.current_tab = 0
