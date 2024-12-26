extends Control

var _mainScene = load("res://main.tscn") as PackedScene
var _gamePlayScene = load("res://gamePlay.tscn") as PackedScene

func _ready() -> void:
	call_deferred("_render_game_over_data")
	
func _load_main_scene():
	get_tree().change_scene_to_packed(_mainScene)

func _load_game_play_scene():
	GlobalData.reset_game_play_values()
	get_tree().change_scene_to_packed(_gamePlayScene)

func _render_game_over_data():
	var _highestWaveLabel = $Panel/Panel/VBoxContainer/HighestWave as Label
	var _highestWaveValue = GlobalData.get_highest_wave()
	_highestWaveLabel.text = "Highest Wave: " + str(_highestWaveValue)
	
	var _currentWaveLabel = $Panel/Panel/VBoxContainer/Wave as Label
	var _currentWaveValue = GlobalData.get_wave_number()
	_currentWaveLabel.text = "Wave: " + str(_currentWaveValue)
	
	var _cashLabel = $Panel/Panel/VBoxContainer/HBoxContainer/Cash/HBoxContainer/Value as Label
	var _cashValue = GlobalData.get_cash_value()
	_cashLabel.text = str("%.1f" % _cashValue)
	
	var _coinLabel = $Panel/Panel/VBoxContainer/HBoxContainer/Coin/HBoxContainer/Value as Label
	var _convertedCoinValue = GlobalData.get_cash_value() / 2.0 # 1 cash = 0.5 coins :)
	_coinLabel.text = str("%.1f" % _convertedCoinValue)
	GlobalData.update_coin_value(_convertedCoinValue)
	
	var _totalCoinLabel = $Panel/Panel/VBoxContainer/HBoxContainer/Total/HBoxContainer/Value as Label
	var _totalCoinValue = GlobalData.get_coin_value()
	_totalCoinLabel.text = str("%.1f" % _totalCoinValue)
