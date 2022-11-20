extends "res://src/Actors/Lifeforms/Lifeform.gd"




func _on_body_entered(body):
	if deal_damage(body):
		die()
