extends "res://src/Actors/Lifeform.gd"

export var money_actor:PackedScene
export var money:int

var rand:RandomNumberGenerator = RandomNumberGenerator.new()

func ready() ->  void:
	rand.randomize()

func die() -> void:
	RandomNumberGenerator
	for i in money:
		var spawn_vect = Vector2(rand.randf_range(-1.0,1.0), rand.randf_range(-1.0,1.0)) * 16
		# TODO SPAWN MONEY


