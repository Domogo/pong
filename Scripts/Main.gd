extends Node2D

const p1_x = 15
var p1_y = 150

const p2_x = 975
var p2_y = 150

var playing = false

func _ready():
	$Player1.set_paddle_position(p1_x, p1_y)
	$Player2.set_paddle_position(p2_x, p2_y)


func _input(_event):
	if Input.is_key_pressed(KEY_SPACE):
		play()


func _process(delta):
	if Input.is_key_pressed(KEY_W):
		p1_y -= 300 * delta
	if Input.is_key_pressed(KEY_S):
		p1_y += 300 * delta
	if Input.is_key_pressed(KEY_UP):
		p2_y -= 300 * delta
	if Input.is_key_pressed(KEY_DOWN):
		p2_y += 300 * delta
	$Player1.set_paddle_position(p1_x, p1_y)
	$Player2.set_paddle_position(p2_x, p2_y)


func play():
	playing = true
	$Ball.set_playing(playing)
