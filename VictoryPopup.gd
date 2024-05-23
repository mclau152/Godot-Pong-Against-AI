extends Control

@onready var label = $Panel/Label
@onready var button = $Panel/Button
@onready var score_label = get_parent().get_node("Score")

func _ready():
	button.connect("pressed", Callable(self, "_on_button_pressed"))
	hide()

func show_victory_message(winner):
	label.text = winner + " wins!"
	show()

func _on_button_pressed():
	hide()
	score_label.reset_game()
