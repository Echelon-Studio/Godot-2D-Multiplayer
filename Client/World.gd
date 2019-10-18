extends Node2D

onready var Player = load("res://Player/Player.tscn")
onready var Bullet = load("res://Bullet/Bullet.tscn")

enum Spawnable {
	player, bullet
}

func spawn(spawnable: int, pos: Vector2, owner: int, name: String):
	var spawn
	match spawnable:
		Spawnable.player:
			spawn = Player.instance()
			spawn.name = String(owner) + name
		Spawnable.bullet:
			spawn = Bullet.instance()
			spawn.name = String(owner) + name
	
	spawn.position = pos
	spawn.set_network_master(owner)
	return spawn

func delete(spawnable: int, name: String):
	match spawnable:
		Spawnable.player:
			$Players.get_node(name).queue_free()
		Spawnable.bullet:
			$Bullets.get_node(name).queue_free()

puppet func spawn_player(spawn_pos: Vector2, owner: int):
	var player = spawn(Spawnable.player, spawn_pos, owner, "Player")
	$Players.add_child(player)

puppet func remove_player(owner: int):
	delete(Spawnable.player, String(owner))

puppetsync func spawn_bullet(spawn_pos: Vector2, owner: int, name: String):
	spawn(Spawnable.bullet, spawn_pos, owner, name)

puppet func remove_bullet(name: String):
	delete(Spawnable.bullet, name)