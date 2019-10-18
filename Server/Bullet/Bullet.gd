extends KinematicBody2D

const SPEED = 600
var direction = Vector2()

puppet var puppet_pos = Vector2()
puppet var puppet_dir = Vector2()

func _ready():
	rset_unreliable("puppet_pos", position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_and_collide((direction * SPEED * delta))
	
func _process(delta):
	rset_unreliable("puppet_pos", position)