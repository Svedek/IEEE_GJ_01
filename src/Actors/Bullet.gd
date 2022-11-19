extends Area2D


export var damage:int = 1
export var speed:float = 900

onready var _a:Area2D = $"."
onready var _spr:Sprite = $"Bullet"

var _move_vector:Vector2 = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func initialize(rot:float, velocity:Vector2):
	_spr.rotate(rot)
	
	_move_vector = Vector2(cos(rot), sin(rot))
	_move_vector *= speed
	_move_vector += velocity
	
	print(_move_vector)
	
	

func _process(delta):
	transform = transform.translated(_move_vector/60)


func _on_body_entered(body: Node):
	if (body.has_method("take_damage")):
		body.take_damage(1)
	queue_free()


func _on_area_entered(area):
	if (area.has_method("take_damage")):
		area.take_damage(1)
	queue_free()
