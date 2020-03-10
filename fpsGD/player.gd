extends KinematicBody

#roughly based on  https://kidscancode.org/blog/2019/03/godot_31_3d_part03/

var velocity = Vector3()
var speed = 6
var gravity = -.5
var rotate_speed = 0.1
var jumping = false
var jump_speed = 6
var bulletMaster

func _ready():
	bulletMaster = preload("res://bullet.tscn")

func _physics_process(delta):
	# strafe controls
	velocity.y += gravity
	velocity.x = 0
	velocity.z = 0
	
	if Input.is_action_pressed("fwd"):
		velocity += -transform.basis.z 
	if Input.is_action_pressed("back"):
		velocity += transform.basis.z 
	if Input.is_action_pressed("left"):
		velocity += -transform.basis.x
	if Input.is_action_pressed("right"):
		velocity += transform.basis.x 
	
	#jump control	
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_speed

	#fire a bullet
	#not yet working
	if Input.is_action_just_pressed("fire"):
		var bullet = bulletMaster.instance()
		bullet.translation = $head/gun.translation


	#movement.  Must include Vector3.UP to clarify what the floor is
	move_and_slide(velocity * speed, Vector3.UP)

func _unhandled_input(event):
	#mouse input
	if event is InputEventMouseMotion:
		#lerp is a linear interpolation to the given speed
		rotate_y(-lerp(0,rotate_speed, event.relative.x/10))
