extends CollisionObject2D


export var _health:int = 1
export var _contact_damage:int = 1
export var _slow:float = 1.0 # 1.0 is no slow, 0.0 is stop entirely; velocity *= slow 


func take_damage(damage:int, slow:float) -> void:
	_health -= damage
	if (_health <= 0):
		die()
		
func deal_damage(n:Node) -> bool:
	if (n.has_method("take_damage")):
		n.take_damage(_contact_damage,_slow)
		return true
	return false
		
func die() -> void:
	disable_col()
	queue_free()

func disable_col() -> void:
	self.set_collision_layer(0)
	self.set_collision_mask(0)
