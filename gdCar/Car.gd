extends KinematicBody
# borrowed heavily from https://kidscancode.org/godot_recipes/g101/3d/101_3d_03/


var gravity = Vector3.DOWN * 12
var speed = 6
var turn_rate = 0.05

var velocity = Vector3()

func get_input():
	velocity.x = 0
	velocity.z = 0
	if Input.is_action_pressed("ui_up"):
		#use transform.basis.z for local z
		velocity += transform.basis.z * -speed
	if Input.is_action_pressed("ui_down"):
		velocity += transform.basis.z * speed
	if Input.is_action_pressed("ui_right"):
		#rotation is easy
		rotate_y(-turn_rate)
	if Input.is_action_pressed("ui_left"):
		rotate_y(turn_rate)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity += gravity * delta
	get_input()
	velocity = move_and_slide(velocity, Vector3.UP)