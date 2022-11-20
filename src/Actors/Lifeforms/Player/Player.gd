extends "res://src/Actors/Lifeforms/Moving_Lifeform.gd"


export var _player_bullet:PackedScene

onready var _firepoint:Node2D = $"Firepoint"
var _bullet_parent:Node


func _ready():
	_bullet_parent = get_node("BulletParent")

func _process(delta):
	handle_input()

func _input(event):
	if event.is_action_pressed("shoot"):
		shoot()

func handle_input():
	var move = Input.get_action_strength("move_forward")
	var turn_dir = Input.get_axis("turn_left","turn_right")
	
	set_move_intent(move,turn_dir)
	
func shoot():
	var bullet = _player_bullet.instance()
	bullet.global_position = _firepoint.global_position
	_bullet_parent.add_child(bullet)
	bullet.initialize(global_rotation,_velocity)

func take_damage(damage:int,slow:float) -> void:
	.take_damage(damage, slow)
	_velocity *= slow
