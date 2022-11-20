extends "res://src/Actors/Lifeforms/Moving_Lifeform.gd"

export var _money_actor:PackedScene
export var _money:int

var rand:RandomNumberGenerator = RandomNumberGenerator.new()

func ready() ->  void:
	rand.randomize()

func die() -> void:
	RandomNumberGenerator
	for i in _money:
		var spawn_vect = Vector2(rand.randf_range(-1.0,1.0), rand.randf_range(-1.0,1.0)) * 16
		# TODO SPAWN MONEY


func move_to_point():
	pass
