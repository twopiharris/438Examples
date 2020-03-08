extends RigidBody

var hitCount = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	#read player.hit_enemy signal and run hit_by_player method
	#get_node("../player").connect("hit_enemy", self, "hit_by_player")
    pass
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		self.reset()
		
func reset():
	self.translation.x = rand_range(-5, 5)
	self.translation.y = 2
	self.translation.z = rand_range(-5, 5)
	
func hit_by_player():
	#print("I was hit by a player")
	hitCount += 1
	if hitCount >= 3:
		self.reset()
		hitCount = 0

#created in IDE
func _on_player_hit_enemy():
	hit_by_player()