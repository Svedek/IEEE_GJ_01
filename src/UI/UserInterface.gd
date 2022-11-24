extends CanvasLayer



export(Array, Resource) var _health_sprites:Array

var _game_time:float

onready var _timer:Label = $"Timer"
onready var _health_display:Array = [$"MarginContainer/Health/Health_0",$"MarginContainer/Health/Health_1",$"MarginContainer/Health/Health_2",$"MarginContainer/Health/Health_3",$"MarginContainer/Health/Health_4"]

func _ready():
	#	PlayerInfo.get_player().connect("change_health", self, "_update_health")
	pass
	
func _process(delta):
	_update_timer(delta)

func _update_health(current_hp:int, max_hp:int):
	pass
	
func _update_timer(delta:float):
	_game_time += delta
	var mins:int = _game_time/60
	var secs:float = _game_time - (mins * 60)
	_timer.text = str(mins) + ":" + str(secs)
