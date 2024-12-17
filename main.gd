extends Control
@export var gamePlayScene: PackedScene  # Drag your Enemy scene here


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	call_deferred("_update_resources")
	GlobalData.coin_value_updated.connect(_update_coin_value)
	GlobalData.gem_value_updated.connect(_update_gem_value)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(gamePlayScene)

func _update_resources():
	_update_coin_value(str(GlobalData.get_coin_value()))
	_update_gem_value(str(GlobalData.get_gem_value()))
	
func _update_coin_value(value):
	var coinValue = $"Panel/HomeScreen/ResourcePanel/ResourceDisplay/Coin/CoinValue" as Label
	coinValue.text = str(value)

func _update_gem_value(value):
	var gemValue = $"Panel/HomeScreen/ResourcePanel/ResourceDisplay/Gem/GemValue" as Label
	gemValue.text = str(value)
