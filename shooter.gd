extends Node2D

var bulletScene = load("res://bullet.tscn") as PackedScene
var enemiesInRange: Array # TODO. CHANGE THIS TO AN OPTIMAL DATA STRUCTURE
# REQUIRED: OPTIMAL ELEMENT REMOVAL, 
var isShooterIdle: bool = true
var bulletSpawnTimer: Timer = Timer.new()
var _attackSpeed: float 
var _temp = _update_shooter_values(0.0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	call_deferred("_add_bullet_timer")
	#call_deferred("_update_shooter_values", 0.0)
	GlobalData.attack_upgrade_values_updated.connect(_update_shooter_values)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

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
	
func _update_shooter_values(unusedVariable: float):
	_attackSpeed = GlobalData.get_attack_speed()
	if(_attackSpeed != 0):
		bulletSpawnTimer.wait_time = 1.0 / _attackSpeed
	else:
		bulletSpawnTimer.wait_time = 10.0 # INFINITY

func _on_enemy_hit(area: Area2D):
	if(area.get_parent().is_in_group("enemies")):
		var enemy = area.get_parent()
		GlobalData.update_health(-enemy.get_current_enemy_damage())
		#enemy.queue_free()
		
