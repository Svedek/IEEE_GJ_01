extends "res://src/Actors/Lifeforms/Lifeform.gd"

export var _player_bullet:PackedScene

export var _drag:float = 0.995
export var _angular_drag:float = 0.975
export var _turn_speed:float = 0.002
export var _move_speed:float = 6

var _velocity:Vector2 = Vector2.ZERO
var _angular_velocity:float
var _move_force:float
var _turn_force:float

onready var _kb:KinematicBody2D = $"."
onready var _firepoint:Node2D = $"Firepoint"
var _bullet_parent:Node


func _ready():
	_bullet_parent = get_node("BulletParent")

func _process(delta):
	handle_input()

func _physics_process(delta):
	handle_movement() # TODO MAKE USE DELTA

func _input(event):
	if event.is_action_pressed("shoot"):
		shoot()



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
	
func shoot():
	var bullet = _player_bullet.instance()
	bullet.global_position = _firepoint.global_position
	_bullet_parent.add_child(bullet)
	bullet.initialize(global_rotation,_velocity)

func take_damage(damage:int,slow:float) -> void:
	.take_damage(damage, slow)
	_velocity *= slow
