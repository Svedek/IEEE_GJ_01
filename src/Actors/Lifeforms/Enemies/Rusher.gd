extends "res://src/Actors/Lifeforms/Enemies/Enemy.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _process(delta):
	target_player()

func target_player():
	var a:Vector2
	a.angle()
	
	set_move_intent(move, turn_dir):
