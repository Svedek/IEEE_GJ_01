extends Node2D


export var _entity:PackedScene

export var _min_dist_from_player:float
export var _max_dist_from_player:float

onready var _range:float = (_max_dist_from_player - _min_dist_from_player)

var _rand:RandomNumberGenerator = RandomNumberGenerator.new() 

func _ready():
	_rand.randomize()

func spawn(num:int):
	for i in range(num):
		print(2.0*PI*_rand.randf())
		var offset = Vector2(_min_dist_from_player + (_rand.randf() * _range),0)
		offset = offset.rotated(2.0*PI*_rand.randf())
		
		var entity = _entity.instance()
		entity.global_position = PlayerInfo.get_player_position() + offset
		self.add_child(entity)
