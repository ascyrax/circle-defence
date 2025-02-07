extends Control
var _gamePlayScene = load("res://gamePlay.tscn") as PackedScene
var _upgradeScene = load("res://upgrades.tscn") as PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	call_deferred("_update_resources")
	GlobalData.coin_value_updated.connect(_update_coin_value)
	GlobalData.gem_value_updated.connect(_update_gem_value)
	
	# reset the gameplay specific values. e.g. wave1 begin cash values, health, etc.
	GlobalData.reset_game_play_values()
	GlobalData.highest_wave_reached.connect(_update_highest_wave_value)

func _render_game_play_scene() -> void:
	get_tree().change_scene_to_packed(_gamePlayScene)

func _update_resources():
	_update_coin_value(GlobalData.get_coin_value())
	_update_gem_value(GlobalData.get_gem_value())
	_update_highest_wave_value(GlobalData.get_highest_wave())

func _update_highest_wave_value(value: float):
	var _highestWaveLabel = $Panel/HomeScreen/CentrePanel/CentreNav/VBoxContainer/WaveSettingsPanel/WaveSettings/HighestWave as Label
	_highestWaveLabel.text = "Highest Wave: " + str(value)
	
func _update_coin_value(value: float):
	var coinValue = $"Panel/HomeScreen/ResourcePanel/ResourceDisplay/Coin/CoinValue" as Label
	coinValue.text = str("%.2f" % value)


func _update_gem_value(value):
	var gemValue = $"Panel/HomeScreen/ResourcePanel/ResourceDisplay/Gem/GemValue" as Label
	gemValue.text = str("%.2f" % value)

func _render_upgrade_scene(event: InputEvent) -> void:
	if(event.is_pressed()):
		get_tree().change_scene_to_packed(_upgradeScene)
