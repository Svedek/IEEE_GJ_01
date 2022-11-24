extends "res://src/Actors/Lifeforms/Enemies/Enemy.gd"


var i = 0

func _process(delta):
	i = (i+1) % 60
	if i == 0:
		print("enemy angular velocity: " + str(_angular_velocity))
	target_player()

func target_player():
	# Get radians to turn to be pointing at the player (-2PI <= turn_dir <= 2PI)
	var to_player:Vector2 = PlayerInfo.get_player_position() - _kb.global_position
	#	print("to_player: " + str(to_player))
	var turn_dir:float = to_player.angle() - _kb.global_rotation
	#	print("to_player.angle(): " + str(to_player.angle()))
	#	print("_kb.global_rotation: " + str(_kb.global_rotation))
	#	print("first turn_dir: " + str(turn_dir))
	
	# Ensure turn_dir is between -PI and PI
	var loop:int = turn_dir / PI
	turn_dir -= loop * (2*PI)
	#	print("normalized turn_dir: " + str(turn_dir))
	
	# Find turn intensity
	var turn_intent:float = turn_dir / PI
	var move_intent:float = (1 - abs(turn_intent))
	move_intent *= move_intent
	#	print("turn_intent: " + str(turn_intent))
	#	print("move_intent: " + str(move_intent))
	
	set_move_intent(move_intent, turn_intent)
