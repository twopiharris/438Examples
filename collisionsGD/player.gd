extends KinematicBody

#register hit_enemy as a signal I will send
signal hit_enemy

var velocity = Vector3()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity = Vector3(0, 0, 0)
	if Input.is_action_pressed("ui_up"):
		velocity.z = -1
	if Input.is_action_pressed("ui_down"):
		velocity.z = 1
	if Input.is_action_pressed("ui_left"):
		velocity.x = -1
	if Input.is_action_pressed("ui_right"):
		velocity.x = 1
		
	self.move_and_slide(velocity)
	

func _on_enemy_body_entered(body):
	if body.get_name() == "player":
		print("player collision")
		#send the "hit_enemy signal"
		emit_signal("hit_enemy")
		
		