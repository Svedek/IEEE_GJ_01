extends "res://src/Actors/Lifeforms/Lifeform.gd"


export var slow:float

func _ready():
	pass


func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(1)
