extends KinematicBody2D

puppet var puppet_pos
puppet var puppet_mousepos

func _ready():
	var player_id = get_network_master()
	$NameLabel.text = gamestate.players[player_id]	
	puppet_pos = position

func _process(delta):
	position = puppet_pos