extends Area2D

const MOVE_SPEED = 300

var _ball_dir
var _up
var _down
var _ball = null
var is_ai_controlled = true

@onready var _screen_size_y = get_viewport_rect().size.y

func _ready():
	var n = String(name).to_lower()
	_up = n + "_move_up"
	_down = n + "_move_down"
	if n == "left":
		_ball_dir = 1
	else:
		_ball_dir = -1

	# Find the ball node
	_ball = get_parent().get_node("Ball")
	if _ball == null:
		print("Ball node not found!")
	else:
		print("Ball node found!")

func _process(delta):
	if is_ai_controlled and name == "Left":
		# AI Movement
		if _ball:
			if _ball.position.y > position.y:
				position.y += MOVE_SPEED * delta
			elif _ball.position.y < position.y:
				position.y -= MOVE_SPEED * delta
	else:
		# Player Movement
		var input = Input.get_action_strength(_down) - Input.get_action_strength(_up)
		position.y = clamp(position.y + input * MOVE_SPEED * delta, 16, _screen_size_y - 16)

	# Ensure the paddle stays within the screen bounds
	position.y = clamp(position.y, 16, _screen_size_y - 16)

func _on_area_entered(area):
	if area.name == "Ball":
		# Assign new direction to the ball
		area.direction = Vector2(_ball_dir, randf() * 2 - 1).normalized()
