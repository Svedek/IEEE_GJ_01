extends Node2D


onready var _spawners:Dictionary = {0:$AsteroidSpawner, 1:$RusherSpawner, 2:$RusherSpawner, 3:$RusherSpawner}

# spawn_index : [time_to_spawn, num_to_spawn, entity_id (in _spawners)]
var _spawn_order:Dictionary = {
	0:[3.0, 2, 1],
	1:[10.0, 4, 1],
	2:[17.0, 5, 1],
	3:[24.0, 6, 1],
	4:[24.0, 3, 0],
	5:[30.0, 6, 1],
	
	6:[999.0, 5, 1],
}

var _next_spawn_index:int = 0

func _on_GameTime_GameTime(game_time):
	if (game_time >= _spawn_order[_next_spawn_index][0]):
		_spawners[_spawn_order[_next_spawn_index][2]].spawn(_spawn_order[_next_spawn_index][1])
		_next_spawn_index += 1
		print("wowie")
