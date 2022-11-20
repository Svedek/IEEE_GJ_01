extends Area2D


export var _damage:int = 1
export var _slow:int = 0.2
export var _speed:float = 900

onready var _a:Area2D = $"."
onready var _spr:Sprite = $"Bullet"

var _move_vector:Vector2 = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func initialize(rot:float, velocity:Vector2):
	_spr.rotate(rot)
	
	_move_vector = Vector2(cos(rot), sin(rot))
	_move_vector *= _speed
	_move_vector += velocity
	
	print(_move_vector)
	
	
func _process(delta):
	transform = transform.translated(_move_vector/60)


func _on_body_entered(body: Node):
	_deal_damage(body)


func _on_area_entered(area):
	_deal_damage(area)
	
	
func _deal_damage(n:Node):
	if (n.has_method("take_damage")):
		n.take_damage(_damage,_slow)
	queue_free()
