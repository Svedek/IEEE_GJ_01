extends CanvasLayer


export(Array, Resource) var _health_sprites:Array

var _game_time:float

onready var _timer:Label = $"Timer"
onready var _hull_ui:HBoxContainer = $"HullUI"

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

func _on_Player_health_update(current_health:int, max_health:int):
	_hull_ui.updateHealth(current_health,max_health)

func _on_Player_money_update(current_money:int):
	emit_signal("ui_money_update",current_money)
