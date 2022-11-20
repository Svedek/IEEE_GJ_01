extends "res://src/Actors/Lifeforms/Enemies/Enemy.gd"


var i = 0

func _process(delta):
	i = (i+1) % 60
	if i == 0:
		print("enemy angular velocity: " + str(_angular_velocity))
	target_player()

func target_player():
	var to_player:Vector2 = PlayerInfo.get_player_position() - _kb.global_position
	var turn_dir:float = to_player.angle() - _kb.global_rotation
	
	
	#if i == 0:
		
	
	#set_move_intent(move, turn_dir)
