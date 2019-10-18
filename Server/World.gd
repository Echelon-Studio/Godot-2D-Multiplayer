extends Node2D

onready var Player = load("res://Player.tscn")
onready var Bullet = load("res://Bullet/Bullet.tscn")

puppetsync func remove_player(id):
	$Players.get_node(String(id)).queue_free()
	
enum Spawnable {
	player, bullet
}

func create(spawnable: int, pos: Vector2, owner: int):
	var spawn
	match spawnable:
		Spawnable.player:
			spawn = Player.instance()
			spawn.name = String(owner)
		Spawnable.bullet:
			spawn = Bullet.instance()
			spawn.name = String(owner) + "bullet"
	
	spawn.position = pos
	spawn.set_network_master(owner)
	return spawn

func delete(spawnable: int, name: String):
	match spawnable:
		Spawnable.player:
			$Players.get_node(name).queue_free()
		Spawnable.bullet:
			$Bullets.get_node(name).queue_free()

puppetsync func spawn_player(spawn_pos: Vector2, owner: int):
	var player = create(Spawnable.player, spawn_pos, owner)
	$Players.add_child(player)

func remove_bullet(name: String):
	delete(Spawnable.bullet, name)