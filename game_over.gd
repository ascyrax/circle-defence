extends Control

var _mainScene = load("res://main.tscn") as PackedScene
var _gamePlayScene = load("res://gamePlay.tscn") as PackedScene

func _ready() -> void:
	pass # Replace with function body.

func _load_main_scene():
	get_tree().change_scene_to_packed(_mainScene)

func _load_game_play_scene():
	GlobalData.reset_game_play_values()
	get_tree().change_scene_to_packed(_gamePlayScene)
