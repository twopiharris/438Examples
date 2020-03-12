extends KinematicBody

var velocity = Vector3()

var speed = 3
var max_x = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	if self.translation.x > max_x:
		speed *= -1
		translation.z += .5
	if self.translation.x < -max_x:
		speed *= -1
		translation.z += .5
	
	velocity.x = speed
	self.move_and_slide(velocity)
