extends MarginContainer


var tab_container : TabContainer

func _ready() -> void:
	tab_container = $TabContainer

func _on_join_game_button_pressed() -> void:
	tab_container.current_tab = 1


func _on_host_game_button_pressed() -> void:
	tab_container.current_tab = 2


func _on_join_back_button_pressed() -> void:
	tab_container.current_tab = 0


func _on_host_back_button_pressed() -> void:
	tab_container.current_tab = 0


func _on_exit_button_pressed() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()
