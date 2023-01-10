extends Node2D


signal GameTime(game_time)

var _game_time:float = 0

func _process(delta):
	_game_time += delta
	emit_signal("GameTime",_game_time)
