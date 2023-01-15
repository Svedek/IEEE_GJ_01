extends "res://src/Actors/Lifeforms/Moving_Lifeform.gd"


signal health_update(current_health,max_health)
signal money_update(current_money)

export var _player_bullet:PackedScene
export var _shot_delay:float = 0.4

onready var _firepoint:Node2D = $"Firepoint"
var _bullet_parent:Node

var _max_health = 6
var _shot_timer:float = 0


func _ready():
	_bullet_parent = get_node("BulletParent")
	PlayerInfo.set_player(_kb)
	emit_signal("health_update",_health,_max_health)

func _process(delta):
	handle_input()
	_shot_timer-=delta

#func _input(event):
#	if event.is_action_pressed("shoot"):
#		shoot()

func handle_input():
	var move = Input.get_action_strength("move_forward")
	var turn_dir = Input.get_axis("turn_left","turn_right")
	if Input.is_action_pressed("shoot") and _shot_timer <= 0:
		shoot()
	
	set_move_intent(move,turn_dir)
	
func shoot():
	var bullet = _player_bullet.instance()
	bullet.global_position = _firepoint.global_position
	_bullet_parent.add_child(bullet)
	bullet.initialize(global_rotation,_velocity)
	_shot_timer = _shot_delay

func take_damage(damage:int,slow:float) -> void:
	_health -= damage
	if (_health <= 0):
		# die
		emit_signal("health_update",0,_max_health)
		self.hide()
		self.set_script(null)
		return
	_velocity *= slow
	emit_signal("health_update",_health,_max_health)
	
