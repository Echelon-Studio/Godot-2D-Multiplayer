extends KinematicBody2D

const SPEED = 600
var direction = Vector2()

puppet var puppet_pos = Vector2()

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position = puppet_pos