extends Node2D


onready var _spawners:Array = [$AsteroidSpawner, $RusherSpawner, $ShooterSpawner, $RusherSpawner]

# [time_to_spawn, num_to_spawn, entity_id (in _spawners)]
var _spawn_order:Array = [
	[3.0, 3, 1],
	[10.0, 5, 1],
	[17.0, 6, 1],
	[24.0, 7, 1],
	[24.0, 3, 0],
	[30.0, 7, 1],
	
	[42.0, 6, 1],
	[42.0, 2, 2],
	[48.0, 5, 0],
	[48.0, 7, 1],
	[48.0, 3, 2],
	[56.0, 7, 1],
	[56.0, 3, 2],
	
	[56.0, 5, 0],
	[60.0, 7, 1],
	[60.0, 3, 2],
	
	[75.0, 64, 1],
	
	[999.0, 5, 1],
]

var _next_spawn_index:int = 0

func _on_GameTime_GameTime(game_time):
	if (game_time >= _spawn_order[_next_spawn_index][0]):
		_spawners[_spawn_order[_next_spawn_index][2]].spawn(_spawn_order[_next_spawn_index][1])
		_next_spawn_index += 1
		print("wowie")
