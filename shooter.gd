extends Node2D

var bulletScene = load("res://bullet.tscn") as PackedScene
var enemiesInRange: Array # TODO. CHANGE THIS TO AN OPTIMAL DATA STRUCTURE
# REQUIRED: OPTIMAL ELEMENT REMOVAL, 
var isShooterIdle: bool = true
var bulletSpawnTimer: Timer = Timer.new()
var _healthRegenerationTimer :Timer = Timer.new()
var _attackSpeed: float 
var _temp = _update_shooter_values(0.0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	call_deferred("_add_bullet_timer")
	call_deferred("_add_health_regeneration_timer", GlobalData.get_health_regeneration())
	#call_deferred("_update_shooter_values", 0.0)
	GlobalData.attack_upgrade_values_updated.connect(_update_shooter_values)
	GlobalData.health_regeneration_value_updated.connect(_add_health_regeneration_timer)

func _regenerate_shooter_health():
	GlobalData.update_health(GlobalData.get_health_regeneration())

func _add_health_regeneration_timer(_healthRegeneration : float):
	add_child(_healthRegenerationTimer)
	#var _healthRegeneration = GlobalData.get_health_regeneration()
	if( _healthRegeneration == 0.0 ):
		_healthRegenerationTimer.wait_time = 1000000 # 1000000 represents INFINITY
	else:
		_healthRegenerationTimer.wait_time = 1.0
	_healthRegenerationTimer.one_shot = false
	_healthRegenerationTimer.connect("timeout", _regenerate_shooter_health)
	_healthRegenerationTimer.start()

func _add_bullet_timer():
	add_child(bulletSpawnTimer)
	if(_attackSpeed != 0):
		bulletSpawnTimer.wait_time = 1.0 / _attackSpeed
	else:
		bulletSpawnTimer.wait_time = 10.0 # INFINITY
	bulletSpawnTimer.one_shot = false
	bulletSpawnTimer.connect("timeout", _shoot_enemy)
	bulletSpawnTimer.start()

func _enemy_in_shooting_radius(area: Area2D) -> void:
	if(area.get_parent().is_in_group("enemies")): # i have placed only the root nodes in groups
		enemiesInRange.append(area)
		# if the enemy entering shooting range enters at a time when bulletSpawnTimer is lets
		# say midway and still has half the time before it reach timeout. we don't want the 
		# shooter to wait this time :)
		if isShooterIdle:
			_spawn_bullet()
			bulletSpawnTimer.stop()
			bulletSpawnTimer.start()
			isShooterIdle = false
	
func _shoot_enemy():
	# do this only if an enemy exist within the range
	if(enemiesInRange.size()):
		_spawn_bullet()
	else:
		isShooterIdle = true
		
func _spawn_bullet():
	# TODO: scale the bullet using code :), currently its scaled using inspector
	if(enemiesInRange.size()):
		var enemyArea2D = enemiesInRange[0] as Area2D
		var enemyRootNode2D = enemyArea2D.get_parent()
		var currentEnemyHealth = enemyRootNode2D.get_current_enemy_health()
		
		var bullet = bulletScene.instantiate()
		add_child(bullet)
		var currentBulletDamage =  bullet.get_current_bullet_damage()
		# handle critical chance
		var _num = randi_range(0, 100)
		var _criticalChance = GlobalData.get_critical_chance()
		var _criticalFactor = GlobalData.get_critical_factor()
		if(_num <= _criticalChance):
			currentBulletDamage *= _criticalFactor
		
		bullet.set_target_enemy(enemyArea2D)
		
		enemyRootNode2D.update_health_during_bullet_spawn(currentBulletDamage)
		
		if( currentEnemyHealth - currentBulletDamage <= 0.0):
			enemiesInRange.erase(enemyArea2D) # TODO. USE AN OPTIMAL METHOD
			
		# each bullet goes to a valid target.
		# i dont want a bullet to leave for an enemy target which is destroyed before the 
		# bullet even reaches it
		# hence, i am deciding previously a legit target for each bullet
		# hence, i have removed any enemy which is alive when the next bullet leave the 
		# shooter, but will be dead before this bullet could reach it
		#enemyRootNode2D.update_health_on_bullet_hit(currentBulletDamage)
	
func _update_shooter_values(_unusedVariable: float):
	_attackSpeed = GlobalData.get_attack_speed()
	if(_attackSpeed != 0):
		bulletSpawnTimer.wait_time = 1.0 / _attackSpeed
	else:
		bulletSpawnTimer.wait_time = 10.0 # INFINITY

func _on_enemy_hit(area: Area2D):
	if(area.get_parent().is_in_group("enemies")):
		var enemy = area.get_parent()
		var _defensePercentage = GlobalData.get_defense_percentage()
		var _defenseAbsolute = GlobalData.get_defense_absolute()
		var _enemyDamage = enemy.get_current_enemy_damage()
		
		_enemyDamage = max(0, _enemyDamage - (_defensePercentage / 100.0 * _enemyDamage))
		_enemyDamage = max( 0, _enemyDamage - _defenseAbsolute)
		
		GlobalData.update_health(-_enemyDamage)
		#enemy.queue_free()
		
