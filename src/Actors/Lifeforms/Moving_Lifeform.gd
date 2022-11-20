extends "res://src/Actors/Lifeforms/Lifeform.gd"


export var _drag:float = 0.1
export var _angular_drag:float = 0.1
export var _turn_speed:float = 1
export var _move_speed:float = 10

onready var _kb = $"."

var _velocity:Vector2 = Vector2.ZERO
var _angular_velocity:float
var _move_force:float
var _turn_force:float


func handle_input():
	var move = Input.get_action_strength("move_forward")
	var turn_dir = Input.get_axis("turn_left","turn_right")
	
	_move_force = move * _move_speed
	_turn_force = turn_dir * _turn_speed
	
func handle_movement():
	_angular_velocity *= _angular_drag
	_velocity *= _drag
	
	_angular_velocity += _turn_force
	var move_vector = Vector2(_move_force*cos(rotation), _move_force*sin(rotation))
	
	rotate(_angular_velocity)
	_velocity = _kb.move_and_slide(_velocity+move_vector)
