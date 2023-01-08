extends HBoxContainer


export(Array, Texture) var _containerTextures:Array

var count:int = 0
#var containers:Dictionary
var _containers:Array

func _ready():
	_ensureContainers(3)

func updateHealth(current:int, cap:int) -> void:
	_ensureContainers(cap)
	for c in _containers:
		var cur = max(min(current, 2),0)
		c.texture=_containerTextures[cur]
		current-=cur

func _ensureContainers(cap:int) -> void:
	if (count < (cap/2)):
		var newContainer:TextureRect = TextureRect.new()
		add_child(newContainer)
		newContainer.texture = _containerTextures[2]
		_containers.append(newContainer)
		
		count+=1
		_ensureContainers(cap)
