extends Area2D


export var damage:int = 1
export var speed:float = 120

onready var _a = $"."
var _move_vector:Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	_move_vector = Vector2.RIGHT
	_move_vector = _move_vector.rotated(_a.global_rotation)
	_move_vector *= speed
	

func _process(delta):
	transform = transform.translated(_move_vector*delta)


func _on_body_entered(body: Node):
	if (body.has_method("take_damage")):
		body.take_damage(1)
	
	queue_free()
