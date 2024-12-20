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
	
