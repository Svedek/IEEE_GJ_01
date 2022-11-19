extends CollisionObject2D


export var health:int = 1


func take_damage(damage:int) -> void:
	health -= damage
	if (health <= 0):
		die()
		
func die() -> void:
	self.set_collision_layer(0)
	self.set_collision_mask(0)
	queue_free()
