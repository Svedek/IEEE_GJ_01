extends Area2D


export var damage:int = 1
export var speed:float = 120

onready var _a = $"."

var _move_vector:Vector2 = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func initialize(rot:float, velocity:Vector2):
	_a.rotate(rot)
	
	_move_vector = Vector2.RIGHT
	_move_vector = _move_vector.rotated(_a.rotation)
	_move_vector *= speed
	_move_vector += velocity
	

func _process(delta):
	transform = transform.translated(_move_vector*delta)


func _on_body_entered(body: Node):
	if (body.has_method("take_damage")):
		body.take_damage(1)
	
	queue_free()
