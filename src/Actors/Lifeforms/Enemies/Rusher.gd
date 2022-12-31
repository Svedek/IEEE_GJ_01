extends "res://src/Actors/Lifeforms/Enemies/Enemy.gd"



func _process(delta):
	target_player()

func target_player():
	# Get radians to turn to be pointing at the player (-2PI <= turn_dir <= 2PI)
	var to_player:Vector2 = PlayerInfo.get_player_position() - _kb.global_position
	var turn_dir:float = to_player.angle() - _kb.global_rotation
	
	# Ensure turn_dir is between -PI and PI
	var loop:int = turn_dir / PI
	turn_dir -= loop * (2*PI)
	
	# Find turn intensity
	var turn_intent:float = turn_dir / PI
	var move_intent:float = (1 - abs(turn_intent))
	move_intent *= move_intent
	
	set_move_intent(move_intent, turn_intent)


func _on_body_entered(body):
	if deal_damage(body):
		take_damage(1,1) # Deal damage to self as well on collision
