extends Label

var left_score = 0
var right_score = 0

@onready var victory_popup = get_parent().get_node("VictoryPopup")
@onready var ball = get_parent().get_node("Ball")
@onready var paddles = get_parent().get_children().filter(func(node): return node.name.contains("Paddle"))

func _ready():
	update_score()

func update_score():
	text = str(left_score) + " - " + str(right_score)

func add_point_left():
	left_score += 1
	update_score()
	check_victory()

func add_point_right():
	right_score += 1
	update_score()
	check_victory()

func check_victory():
	if left_score == 7:
		end_game("Left")
	elif right_score == 7:
		end_game("Right")

func end_game(winner):
	victory_popup.show_victory_message(winner)
	ball.set_process(false)
	for paddle in paddles:
		paddle.set_process(false)

func reset_game():
	left_score = 0
	right_score = 0
	update_score()
	ball.set_process(true)
	ball.reset_position()
	for paddle in paddles:
		paddle.set_process(true)
