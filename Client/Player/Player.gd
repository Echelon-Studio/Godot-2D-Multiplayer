extends KinematicBody2D

export (float) var speed = 128
export (float) var sprint_speed = 200
var direction = Vector2()
var sprint_mod = 0

func get_input():
	direction = Vector2(
		int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left")),
		int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	)
	direction = direction.normalized()
	if Input.is_action_pressed("sprint"):
		sprint_mod = 1
	else:
		sprint_mod = 0

func _physics_process(delta):
	get_input()
	move_and_slide(direction * (speed + sprint_speed * sprint_mod))
	look_at(get_global_mouse_position())