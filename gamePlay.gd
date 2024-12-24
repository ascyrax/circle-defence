extends Control

#var _mainScene = load("res://main.tscn") as PackedScene
var _enemyScene = load("res://enemy.tscn") as PackedScene
var _bossScene = load("res://boss.tscn") as PackedScene
var _shooterScene = load("res://shooter.tscn") as PackedScene
var _attackUpgradeScene = load("res://attack_upgrades.tscn") as PackedScene
var _defenseUpgradeScene = load("res://defense_upgrades.tscn") as PackedScene
var _utilityUpgradeScene = load("res://utility_upgrades.tscn") as PackedScene
var _gameOverScene = load("res://game_over.tscn") as PackedScene
var _enemySpawnInterval: float = GlobalData.get_enemy_spawn_interval()
var _shooterGlobalPosition
var _shooterSpriteSize = Vector2(0.0, 0.0)
#var _temp = _update_shooter_data()
#var _temp2 = _update_resources()
#var _temp3 = _update_wave_data()
#var _waveNumber:float = 1
var _enemySpawnTimer : Timer

func _ready() -> void:
	# Defer the size calculation to ensure layout is finalized
	call_deferred("_spawn_shooter")
	call_deferred("_set_shooter_range_scale")
	call_deferred("spawn_enemies")
	call_deferred("_render_attack_upgrades")
	
	call_deferred("_update_resources")
	call_deferred("_update_shooter_data", 0.0)
	call_deferred("_update_wave_data", 0.0)
	# connect to the global_data.gd (GlobalData) script for global values
	GlobalData.cash_value_updated.connect(_update_cash_value)
	GlobalData.coin_value_updated.connect(_update_coin_value)
	GlobalData.gem_value_updated.connect(_update_gem_value)
	
	GlobalData.attack_upgrade_values_updated.connect(_update_shooter_data)
	GlobalData.defense_upgrade_values_updated.connect(_update_shooter_data)
	
	GlobalData.wave_enemies_spawned.connect(_pause_enemy_spawn)
	GlobalData.wave_enemies_killed.connect(_resume_enemy_spawn)
	GlobalData.wave_changed.connect(_update_wave_data)
	
	GlobalData.game_over.connect(_load_game_over_scene, 0.0)

func _pause_enemy_spawn(_val: float):
	_enemySpawnTimer.stop()
	GlobalData.set_wave_enemies_spawned(0)
	
func _resume_enemy_spawn(_val:float):
	_enemySpawnTimer.start()
	GlobalData.update_wave_number(+1)
	GlobalData.set_wave_enemies_killed(0)
	
func _load_game_over_scene(_value: float):
	get_tree().change_scene_to_packed(_gameOverScene)
	
func _update_shooter_data(_value: float):
	var _health = GlobalData.get_health()
	var _damage = GlobalData.get_damage()
	var _healthRegeneration = GlobalData.get_health_regeneration()
	#var _coinMultiplier = GlobalData.get_coin_multiplier() # based on difficulty level
	
	var _healthLabel = $Panel/VBoxContainer/Details/Player/PlayerDetails/Control/Label as Label
	_healthLabel.text = "Health: " + str("%.2f" % _health)
	
	var _damageLabel = $Panel/VBoxContainer/Details/Player/PlayerDetails/HBoxContainer/Damage/Value as Label
	_damageLabel.text = str(_damage)
	
	var _healthRegenerationLabel = $Panel/VBoxContainer/Details/Player/PlayerDetails/HBoxContainer/Regeneration/Value as Label
	_healthRegenerationLabel.text = str(_healthRegeneration)

func _update_wave_data(_value: float):
	var _waveNumber = GlobalData.get_wave_number()
	var _enemyDamage = GlobalData.get_enemy_damage()
	var _enemyHealth = GlobalData.get_enemy_health()
	
	var _waveNumberLabel = $Panel/VBoxContainer/Details/Wave/WaveDetails/Wave/WaveNo as Label
	var _enemyDamageLabel = $Panel/VBoxContainer/Details/Wave/WaveDetails/Enemy/Attack/Value as Label
	var _enemyHealthLabel = $Panel/VBoxContainer/Details/Wave/WaveDetails/Enemy/Health/Value as Label
	
	_waveNumberLabel.text  = "Wave " + str(_waveNumber)
	_enemyDamageLabel.text = str("%.2f" % _enemyDamage)
	_enemyHealthLabel.text = str("%.2f" % _enemyHealth)
	


func _spawn_shooter():
	var shooterInstance = _shooterScene.instantiate() as Node2D
	var shooterContainer = $"Panel/VBoxContainer/GamePlayNode" as Control
	shooterContainer.add_child(shooterInstance)
	var shooter = $"Panel/VBoxContainer/GamePlayNode/Shooter" as Node2D
	var width = shooterContainer.size[0]
	var height = shooterContainer.size[1]
	shooter.position = Vector2(width/2.0,height/2.0)
	_shooterGlobalPosition = shooter.global_position
	
	# adjust shooter sprite size
	var shooterSprite = $"Panel/VBoxContainer/GamePlayNode/Shooter/Shooter/Sprite2D" as Sprite2D
	# shooterSprite has a width = height = around 500px
	# we want it to be 100px wide
	shooterSprite.scale = Vector2(0.2, 0.2)
	_shooterSpriteSize = shooterSprite.texture.get_size() * shooterSprite.scale
	
func _set_shooter_range_scale():
	var shooterRange = $"Panel/VBoxContainer/GamePlayNode/Shooter/Range/CollisionShape2D".shape as CircleShape2D
	var rangeSprite = $"Panel/VBoxContainer/GamePlayNode/Shooter/Range/Sprite2D" as Sprite2D
	var correctScaleX = (shooterRange.radius *2.0) / (rangeSprite.texture.get_width() * 1.0)
	var correctScaleY = (shooterRange.radius *2.0) / (rangeSprite.texture.get_height() * 1.0)
	rangeSprite.scale = Vector2(correctScaleX, correctScaleY)

func spawn_enemies():
	_enemySpawnTimer = Timer.new()
	add_child(_enemySpawnTimer)
	_enemySpawnTimer.wait_time = _enemySpawnInterval
	_enemySpawnTimer.one_shot= false
	_enemySpawnTimer.connect("timeout", _spawn_enemy)
	_enemySpawnTimer.start()

func _convert_to_wave_boss(_newEnemy: Node2D):
	_newEnemy.update_enemy_values(2.0)
	_newEnemy.set_enemy_sprite_scale(1.25)
	

func _spawn_enemy():
	var _waveNumber = GlobalData.get_wave_number()
	var _newEnemy : Node2D
	var _id : float
	GlobalData.update_wave_enemies_spawned(+1.0)
	_id = GlobalData.get_wave_enemies_spawned()
	if(int(_waveNumber) % 10 == 0 && _id == 1.0):
		_newEnemy = _bossScene.instantiate() as Node2D
	else:
		_newEnemy = _enemyScene.instantiate() as Node2D
		if( _id == GlobalData.get_base_enemy_spawn_per_wave()):
			_convert_to_wave_boss(_newEnemy)

	var enemyContainer = $"Panel/VBoxContainer/EnemySpawner" as Node2D
	enemyContainer.add_child(_newEnemy)
	
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
	_newEnemy.position = Vector2(posX, posY)
	
	 # Set the direction toward the centreShooterSprite2D
	if _newEnemy.has_method("set_direction"):
		var direction = (_shooterGlobalPosition - _newEnemy.position).normalized()
		_newEnemy.set_direction(direction, _shooterGlobalPosition)
		_newEnemy.set_collision_from_shooter(_shooterSpriteSize)
		_newEnemy.set_enemy_rotation()

func _update_resources():
	_update_cash_value((GlobalData.get_cash_value()))
	_update_coin_value((GlobalData.get_coin_value()))
	_update_gem_value((GlobalData.get_gem_value()))

func _update_cash_value(value):
	var cashValue = $"Panel/VBoxContainer/MarginContainer/HBoxContainer/VBoxContainer/Cash/CashValue" as Label
	cashValue.text = str("%.2f" % value)
	
func _update_coin_value(value):
	var coinValue = $"Panel/VBoxContainer/MarginContainer/HBoxContainer/VBoxContainer/Coin/CoinValue" as Label
	coinValue.text = str("%.2f" % value)

func _update_gem_value(value):
	var gemValue = $"Panel/VBoxContainer/MarginContainer/HBoxContainer/VBoxContainer/Gem/GemValue" as Label
	gemValue.text = str("%.2f" % value)
	
func _render_attack_upgrades():
	var attackUpgradeInstance = _attackUpgradeScene.instantiate() as Control
	var upgradesContainer = $"Panel/VBoxContainer/Upgrades" as Control
	upgradesContainer.add_child(attackUpgradeInstance)
	attackUpgradeInstance.set_anchors_preset(Control.PRESET_VCENTER_WIDE)

func _render_defense_upgrades():
	var defenseUpgradeInstance = _defenseUpgradeScene.instantiate() as Control
	var upgradesContainer = $"Panel/VBoxContainer/Upgrades" as Control
	upgradesContainer.add_child(defenseUpgradeInstance)
	defenseUpgradeInstance.set_anchors_preset(Control.PRESET_VCENTER_WIDE)

func _render_utility_upgrades():
	var utilityUpgradeInstance = _utilityUpgradeScene.instantiate() as Control
	var upgradesContainer = $"Panel/VBoxContainer/Upgrades" as Control
	upgradesContainer.add_child(utilityUpgradeInstance)
	utilityUpgradeInstance.set_anchors_preset(Control.PRESET_VCENTER_WIDE)
		
func _show_attack_upgrades(event: InputEvent):
	if(event is InputEventMouseButton or event is InputEventScreenTouch):
		# before rendering this, remove the previous upgrades that was present here :)
		var _upgrades = $Panel/VBoxContainer/Upgrades as Control
		for child in _upgrades.get_children():
			child.queue_free()
		_render_attack_upgrades()

func _show_defense_upgrades(event: InputEvent):
	if(event is InputEventMouseButton or event is InputEventScreenTouch):
		# before rendering this, remove the previous upgrades that was present here :)
		var _upgrades = $Panel/VBoxContainer/Upgrades as Control
		for child in _upgrades.get_children():
			child.queue_free()
		_render_defense_upgrades()
		
func _show_utility_upgrades(event: InputEvent):
	if(event is InputEventMouseButton or event is InputEventScreenTouch):
		# before rendering this, remove the previous upgrades that was present here :)
		var _upgrades = $Panel/VBoxContainer/Upgrades as Control
		for child in _upgrades.get_children():
			child.queue_free()
		_render_utility_upgrades()
