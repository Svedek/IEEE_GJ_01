extends KinematicBody2D


export var damage:int = 1
export var speed:float = 120

onready var _a = $"."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _process(delta):
	#move_and_collide()
	pass


func _on_body_entered(body: Node):
	if (body.has_method("take_damage")):
		body.take_damage(1)
	
	queue_free()
