extends CanvasLayer


var _game_time:float

var _timer:Label

func _ready():
	_timer = get_node("Timer")
	
	#	PlayerInfo.get_player().connect("change_health", self, "_update_health")

func _process(delta):
	_update_timer(delta)

func _update_health(current_hp:int, max_hp:int):
	pass
	
func _update_timer(delta:float):
	_game_time += delta
	var mins:int = _game_time/60
	var secs:float = _game_time - (mins * 60)
	_timer.text = str(mins) + ":" + str(secs)
