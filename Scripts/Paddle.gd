extends KinematicBody2D


func _ready():
	pass

func set_paddle_position(x, y):
	if y <= 0:
		y = 1
	if y >= 600 - 250:
		y = 599 - 250
	self.position = Vector2(x, y)
