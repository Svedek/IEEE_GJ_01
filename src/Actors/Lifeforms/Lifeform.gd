extends CollisionObject2D


export var health:int = 1


func take_damage(damage:int) -> void:
	health -= damage
	if (health <= 0):
		die()
		
func die() -> void:
	queue_free()
