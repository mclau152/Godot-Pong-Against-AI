extends Area2D

const DEFAULT_SPEED = 500

var _speed = DEFAULT_SPEED
var direction = Vector2.LEFT
var initial_position

@onready var _initial_pos = position

func _process(delta):
	_speed += delta * 2
	position += _speed * delta * direction


func reset():
	direction = Vector2.LEFT
	position = _initial_pos
	_speed = DEFAULT_SPEED


func reset_position():
	position = _initial_pos
	# You can add more logic to reset the ball's velocity and direction if needed
