extends Node2D

var BALL_NODE = preload("../Scenes/Ball.tscn")
var ball = BALL_NODE.instance()

const DEFAULT_Y = 150
const p1_x = 15
var p1_y = DEFAULT_Y

const p2_x = 975
var p2_y = DEFAULT_Y

var playing = false
var score_event = false

func _ready():
	set_ball()
	$Player1.set_paddle_position(p1_x, p1_y)
	$Player2.set_paddle_position(p2_x, p2_y)
	$PlayMessage.visible = true


func _input(_event):
	if Input.is_key_pressed(KEY_SPACE):
		play()


func _process(delta):
	handle_movement_input(delta)
	$Player1.set_paddle_position(p1_x, p1_y)
	$Player2.set_paddle_position(p2_x, p2_y)
	check_point_scored()
	handle_score_event()


func play():
	playing = true
	ball.set_playing(playing)
	$PlayMessage.visible = false


func check_point_scored():
	if ball.position.x <= 0 or ball.position.x >= 1000:
		score_event = true


func handle_movement_input(delta):
	if Input.is_key_pressed(KEY_W):
		p1_y -= 300 * delta
	if Input.is_key_pressed(KEY_S):
		p1_y += 300 * delta
	if Input.is_key_pressed(KEY_UP):
		p2_y -= 300 * delta
	if Input.is_key_pressed(KEY_DOWN):
		p2_y += 300 * delta


func handle_score_event():
	if score_event:
		remove_ball()
		set_ball()
		reset_paddle_positions()
		$PlayMessage.visible = true
		playing = false
		score_event = false


func remove_ball():
	remove_child(ball)


func set_ball():
	ball = BALL_NODE.instance()
	add_child(ball)


func reset_paddle_positions():
	p1_y = DEFAULT_Y
	p2_y = DEFAULT_Y
