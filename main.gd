extends Control
var gamePlayScene = load("res://gamePlay.tscn") as PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	call_deferred("_update_resources")
	GlobalData.coin_value_updated.connect(_update_coin_value)
	GlobalData.gem_value_updated.connect(_update_gem_value)
	
	# reset the gameplay specific values. e.g. wave1 begin cash values, health, etc.
	GlobalData.reset_game_play_values()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(gamePlayScene)

func _update_resources():
	_update_coin_value(GlobalData.get_coin_value())
	_update_gem_value(GlobalData.get_gem_value())
	
func _update_coin_value(value: float):
	var coinValue = $"Panel/HomeScreen/ResourcePanel/ResourceDisplay/Coin/CoinValue" as Label
	coinValue.text = str("%.2f" % value)


func _update_gem_value(value):
	var gemValue = $"Panel/HomeScreen/ResourcePanel/ResourceDisplay/Gem/GemValue" as Label
	gemValue.text = str("%.2f" % value)
