extends KinematicBody

var velocity = Vector3(0, 0,-5)

# Called when the node enters the scene tree for the first time.
func _ready():
	#move to current position of player
	self.translation.x = get_parent().get_node("player").translation.x
	self.translation.z = get_parent().get_node("player").translation.z

func _physics_process(delta):
	var collisions = move_and_collide(velocity * delta)
	
	#remove instance when off screen
	if self.translation.z < -5:
		queue_free()

	# check for collisions
	if collisions:
		# because I've set up collision groups
		# bullet only registers collisions with enemy
		var collider = collisions.get_collider()
		#remove self (bullet) and enemy
		collider.queue_free()
		self.queue_free()
