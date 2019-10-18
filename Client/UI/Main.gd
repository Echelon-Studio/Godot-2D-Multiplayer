extends Control

onready var status = get_node("VBox/Status")


func _ready():
	gamestate.connect("connection_failed", self, "_on_connection_failed")
	gamestate.connect("connection_succeeded", self, "_on_connection_success")
	gamestate.connect("server_disconnected", self, "_on_server_disconnect")
	#gamestate.connect("players_updated", self, "update_players_list")


func _on_JoinButton_pressed():
	gamestate.my_name = $VBox/HBoxContainer/PlayerName.text
	gamestate.ip = $VBox/HBoxContainer2/IPText.text
	gamestate.connect_to_server()


func _on_connection_success():
	gamestate.pre_start_game()
	queue_free()
	#$VBox/JoinButton.disabled = false
	
	#status.text = "Connected"
	#status.modulate = Color.green


func _on_connection_failed():	
	status.text = "Connection Failed, trying again"
	status.modulate = Color.red


func _on_server_disconnect():
	status.text = "Server Disconnected, trying to connect..."
	status.modulate = Color.red