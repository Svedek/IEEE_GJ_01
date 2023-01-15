extends Area2D


export var _damage:int = 1
export var _slow:int = 0.8
export var _speed:float = 900

var _move_vector:Vector2 = Vector2.ZERO


# Called by creator when the node enters the scene tree for the first time.
func initialize(rot:float, velocity:Vector2):
	self.rotate(rot)
	_move_vector = Vector2(_speed, 0)
	_move_vector += velocity.rotated(-1*rot)
	
	
func _process(delta):
	transform = transform.translated(_move_vector*delta)


func _on_body_entered(body: Node):
	_deal_damage(body)


func _on_area_entered(area):
	_deal_damage(area)
	
	
func _deal_damage(n:Node):
	if (n.has_method("take_damage")):
		n.take_damage(_damage,_slow)
	queue_free()
