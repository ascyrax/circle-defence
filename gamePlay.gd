extends Control

@export var enemyScene: PackedScene  # Drag your Enemy scene here
@export var shooterScene: PackedScene
var enemySpawnInterval: float = 1
var shooterContainerPosition
var shooterGlobalPosition
var shooterSpriteSize = Vector2(0.0, 0.0)

func _ready() -> void:
	# Defer the size calculation to ensure layout is finalized
	call_deferred("_spawn_shooter")
	call_deferred("_set_shooter_range_scale")
	call_deferred("spawn_enemies")
	call_deferred("_render_upgrade_window")
	
	call_deferred("_update_resources")
	# connect to the global_data.gd (GlobalData) script for global values
	GlobalData.dollar_value_updated.connect(_update_dollar_value)
	GlobalData.coin_value_updated.connect(_update_coin_value)
	GlobalData.gem_value_updated.connect(_update_gem_value)

func _process(delta: float) -> void:
	pass
	
func _spawn_shooter():
	var shooterInstance = shooterScene.instantiate() as Node2D
	var shooterContainer = $"Panel/VBoxContainer/GamePlayNode" as Control
	shooterContainer.add_child(shooterInstance)
	var shooter = $"Panel/VBoxContainer/GamePlayNode/Shooter" as Node2D
	var width = shooterContainer.size[0]
	var height = shooterContainer.size[1]
	shooter.position = Vector2(width/2.0,height/2.0)
	shooterGlobalPosition = shooter.global_position
	
	# adjust shooter sprite size
	var shooterSprite = $"Panel/VBoxContainer/GamePlayNode/Shooter/Sprite2D" as Sprite2D
	shooterSprite.scale = Vector2(0.1, 0.1)
	shooterSpriteSize = shooterSprite.texture.get_size() * shooterSprite.scale
	
func _set_shooter_range_scale():
	var shooterRange = $"Panel/VBoxContainer/GamePlayNode/Shooter/Area2D/CollisionShape2D".shape as CircleShape2D
	var rangeSprite = $"Panel/VBoxContainer/GamePlayNode/Shooter/Area2D/Sprite2D" as Sprite2D
	var correctScaleX = (shooterRange.radius *2.0) / (rangeSprite.texture.get_width() * 1.0)
	var correctScaleY = (shooterRange.radius *2.0) / (rangeSprite.texture.get_height() * 1.0)
	rangeSprite.scale = Vector2(correctScaleX, correctScaleY)

func spawn_enemies():
	var enemySpawnTimer = Timer.new()
	add_child(enemySpawnTimer)
	enemySpawnTimer.wait_time = enemySpawnInterval
	enemySpawnTimer.one_shot= false
	enemySpawnTimer.connect("timeout", _spawn_enemy)
	enemySpawnTimer.start()
	
func _spawn_enemy():
	var newEnemy = enemyScene.instantiate() as Node2D

	var enemyContainer = $"Panel/VBoxContainer/EnemySpawner"
	enemyContainer.add_child(newEnemy)
	
	var randNo = randi_range(0,3) # 0, 1, 2 or 3 viz. top, right, bottom or left edge
	var posX = 0.0 
	var posY = 0.0
	
	var viewportSize = get_viewport_rect().size
	match randNo:
		0:
			posX = randf_range(0, viewportSize.x)
			posY = 0.0
		1:
			posX = viewportSize.x
			posY = randf_range(0, viewportSize.y)
		2:
			posX = randf_range(0, viewportSize.x)
			posY = viewportSize.y
			
		3:
			posX = 0
			posY = randf_range(0, viewportSize.y)
	newEnemy.position = Vector2(posX, posY)
	
	 # Set the direction toward the centreShooterSprite2D
	if newEnemy.has_method("set_direction"):
		var direction = (shooterGlobalPosition - newEnemy.position).normalized()
		newEnemy.set_direction(direction, shooterGlobalPosition)
		newEnemy.set_collision_from_shooter(shooterSpriteSize)

func _render_upgrade_window():
	var attackUpgradeScene = load("res://attack_upgrades.tscn") as PackedScene
	var attackUpgradeInstance = attackUpgradeScene.instantiate() as Control
	print(attackUpgradeInstance)
	var upgradesContainer = $"Panel/VBoxContainer/Upgrades" as Control
	print(upgradesContainer)
	upgradesContainer.add_child(attackUpgradeInstance)
	attackUpgradeInstance.set_anchors_preset(Control.PRESET_VCENTER_WIDE)
	
func _update_resources():
	_update_dollar_value(str(GlobalData.get_dollar_value()))
	_update_coin_value(str(GlobalData.get_coin_value()))
	_update_gem_value(str(GlobalData.get_gem_value()))

func _update_dollar_value(value):
	var dollarValue = $"Panel/VBoxContainer/MarginContainer/HBoxContainer/VBoxContainer/Dollar/DollarValue" as Label
	dollarValue.text = str(value)
	
func _update_coin_value(value):
	var coinValue = $"Panel/VBoxContainer/MarginContainer/HBoxContainer/VBoxContainer/Coin/CoinValue" as Label
	coinValue.text = str(value)

func _update_gem_value(value):
	var gemValue = $"Panel/VBoxContainer/MarginContainer/HBoxContainer/VBoxContainer/Gem/GemValue" as Label
	gemValue.text = str(value)
