extends MarginContainer

@onready var PlayerList = $TabContainer/Lobby/HSplitContainer/PlayerList/ItemList
@onready var tab_container : TabContainer = $TabContainer
var game_scene_file: String = "res://map.tscn"

func _ready() -> void:
	Lobby.player_connected.connect(_add_new_username)
	

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
	Lobby.host_game()
	

func _on_join_button_pressed() -> void:
	tab_container.current_tab = 2
	Lobby.join_game($TabContainer/LAN/VBoxContainer/IPInputBox.text)
	#Lobby.player_loaded.rpc_id(1) # TODO: Run on hot join


func _on_lan_back_button_pressed() -> void:
	tab_container.current_tab = 3


func _on_lobby_back_button_pressed() -> void:
	tab_container.current_tab = 1


func _on_enter_name_back_button_pressed() -> void:
	tab_container.current_tab = 0


func _on_start_button_pressed() -> void:
	Lobby.load_game.rpc(game_scene_file)
	hide()
	
func _add_new_username(id: int, info: Dictionary) -> void:
	PlayerList.add_item(str(id))
