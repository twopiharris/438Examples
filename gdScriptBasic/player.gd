extends KinematicBody

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_up"):
		self.translation.z -= .1
	if Input.is_action_pressed("ui_down"):
		self.translation.z += .1
	if Input.is_action_pressed("ui_left"):
		self.translation.x -= .1
	if Input.is_action_pressed("ui_right"):
		self.translation.x += .1
		