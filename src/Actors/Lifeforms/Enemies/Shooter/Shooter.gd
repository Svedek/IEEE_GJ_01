extends "res://src/Actors/Lifeforms/Enemies/Enemy.gd"


export var _shooter_bullet:PackedScene

export var _inner_dist:float = 256.0
export var _outer_radius:float = 512.0
export var _shot_delay:float = 1.0

onready var _firepoint:Node2D = $Firepoint
onready var _bullet_parent:Node = $BulletParent

var _shot_timer = _shot_delay

# 0 is inside inner radius of player, 1 is between both radii of player, 2 is outside of outer radius of player
var _state = 0


func _process(delta):
	set_state()
	handle_action(delta)

func set_state():
	var dist:float = (PlayerInfo.get_player_position() - _kb.global_position).length()
	if (_inner_dist > dist):
		_state = 0
		return
		
	if (dist > _outer_radius):
		_state = 2
		return
		
	_state = 1

func handle_action(delta):
	match _state:
		0: # turn away and retreat from player
			var move_vals =_calculate_move_intent(PI)
			set_move_intent(move_vals.x, move_vals.y)
			return
			
		1: # turn towards and fire at player
			var move_vals =_calculate_move_intent(0)
			set_move_intent(move_vals.x/4.0, move_vals.y)
			_shot_timer -= delta
			if _shot_timer < 0.0:
				_shoot()
			return
			
		2: # turn towards and approach player
			var move_vals =_calculate_move_intent(0)
			set_move_intent(move_vals.x, move_vals.y)
			return

func _calculate_move_intent(angular_offset:float) -> Vector2:
	# Get radians to turn to be pointing at the player (-2PI <= turn_dir <= 2PI)
	var to_player:Vector2 = PlayerInfo.get_player_position() - _kb.global_position
	var turn_dir:float = to_player.angle() - _kb.global_rotation + angular_offset
	
	# Ensure turn_dir is between -PI and PI
	var loop:int = turn_dir / PI
	turn_dir -= loop * (2*PI)
	
	# Find turn intensity
	var turn_intent:float = turn_dir / PI
	var move_intent:float = (1 - abs(turn_intent))
	move_intent *= move_intent # Square this to make the differance more drastic, test without
	
	return Vector2(move_intent, turn_intent)
	

func _shoot():
	_shot_timer = _shot_delay
	var bullet = _shooter_bullet.instance()
	bullet.global_position = _firepoint.global_position
	_bullet_parent.add_child(bullet)
	bullet.initialize(global_rotation,_velocity)

func _on_body_entered(body):
	if deal_damage(body):
		take_damage(1,1) # Deal damage to self as well on collision
