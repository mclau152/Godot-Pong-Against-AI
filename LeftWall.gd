extends Area2D

func _on_wall_area_entered(area):
	if area.name == "Ball":
		score_label.add_point_right()
		#oops, ball went out of game place, reset
		area.reset()
# Reference to the score label node
@onready var score_label = get_parent().get_node("Score")



func _on_area_entered(area):
	if area.name == "Ball":
		score_label.add_point_right()
		
		# Reset ball position or any other logic to restart play
		
