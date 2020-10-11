extends RigidBody2D

var dx = 100
var dy = 0
var speed = 150
var dy_range = 100

func _ready():
	pass


func _physics_process(delta):
	check_point_scored()
	change_dy_on_wall_hit()
	self.rotation = 0
	self.linear_velocity = Vector2(dx, dy) * delta * speed


func _ball_hit_paddle(_body):
	dx *= -1
	dy = rand_range(-dy_range, dy_range)


func change_dy_on_wall_hit():
	if self.position.y <= 0:
		dy = rand_range(0, dy_range)
	if self.position.y >= 600:
		dy = rand_range(-dy_range, 0)


func check_point_scored():
	if self.position.x <= 0:
		print("score p2")
	if self.position.x >= 1000:
		print("score p1")
