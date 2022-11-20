extends Node

var _player:KinematicBody2D



func set_player(player:KinematicBody2D) -> void:
	_player = player

func get_player() -> KinematicBody2D:
	return _player
	
func get_player_position() -> Vector2:
	return _player.global_position
	
