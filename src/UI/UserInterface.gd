extends CanvasLayer


onready var _timer:Label = $"Timer"
onready var _hull_ui:HBoxContainer = $"HullUI"


func _on_GameTime_GameTime(game_time):
	_timer.text = str(stepify(game_time,0.001))

func _on_Player_health_update(current_health:int, max_health:int):
	_hull_ui.updateHealth(current_health,max_health)

func _on_Player_money_update(current_money:int):
	pass

