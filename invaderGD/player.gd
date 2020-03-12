extends KinematicBody

var velocity = Vector3()
var speed = 5
var bulletScene = preload("res://bullet.tscn")

func _physics_process(delta):
	velocity.x = 0
	
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed 
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed 

	if Input.is_action_just_pressed("ui_accept"):
		fire()

	move_and_slide(velocity)
	
func fire():
	var bullet = bulletScene.instance()
	self.get_parent().add_child(bullet)
	
