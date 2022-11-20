extends "res://src/Actors/Lifeforms/Lifeform.gd"


export(float, 0.0, 1.0) var _drag:float = 0.995 # 1.0 drag maintains full velocity *= drag
export(float, 0.0, 1.0)  var _angular_drag:float = 0.975
export var _turn_speed:float = 0.002
export var _move_speed:float = 6

onready var _kb = $"."

var _velocity:Vector2 = Vector2.ZERO
var _angular_velocity:float
var _move_force:float
var _turn_force:float


func _physics_process(delta):
	handle_movement() # possibly make use delta

func set_move_intent(move:float, turn_dir:float):
	_move_force = move * _move_speed
	_turn_force = turn_dir * _turn_speed
	
# Assumes _move_force and _turn_force have already been set
func handle_movement():
	_angular_velocity *= _angular_drag
	_velocity *= _drag
	
	_angular_velocity += _turn_force
	var move_vector = Vector2(_move_force*cos(rotation), _move_force*sin(rotation))
	
	rotate(_angular_velocity)
	_velocity = _kb.move_and_slide(_velocity+move_vector)
