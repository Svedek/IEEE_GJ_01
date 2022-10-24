extends KinematicBody2D


export var player_bullet:PackedScene

export var drag:float = 0.1
export var angular_drag:float = 0.1
export var turn_speed:float = 1
export var move_speed:float = 10


var _velocity:Vector2 = Vector2.ZERO
var _angular_velocity:float
var _move_force:float
var _turn_force:float

onready var _kb:KinematicBody2D = $"."
onready var _firepoint:Node2D = $"Firepoint"


func _ready():
	# Make bullet parent to be populated
	pass

func _process(delta):
	handle_input()
	handle_movement()

	
	
	
func _input(event):
	if event.is_action_pressed("shoot"):
		shoot()




func handle_input():
	var move = Input.get_action_strength("move_forward")
	var turn_dir = Input.get_axis("turn_left","turn_right")
	
	_move_force = move * move_speed
	_turn_force = turn_dir * turn_speed
	
func handle_movement():
	_angular_velocity *= angular_drag
	_velocity *= drag
	
	
	_angular_velocity += _turn_force
	var move_vector = Vector2(_move_force*cos(rotation), _move_force*sin(rotation))
	
	rotate(_angular_velocity)
	_velocity = move_and_slide(_velocity+move_vector)
	
func shoot():
	var bullet = player_bullet.instance()
	add_child_below_node
	get_tree().get_root().add_child_below_node()
	
	get_parent()
	#add_child(bullet)
	print("shoot")
