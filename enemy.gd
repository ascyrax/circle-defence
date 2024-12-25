extends Node2D

@export var speed: float = randi_range(50, 150)  # Speed of the enemy
var _explosionScene = load("res://enemy_explosion.tscn") as PackedScene
var direction: Vector2 = Vector2.ZERO  # Direction toward the center
var shooterContainerPosition : Vector2
var _health: float = 1.0
var _healthDuringBulletSpawn: float = 1.0
var _damage: float = 1.0
var shooterSpriteSize = Vector2(0.0,0.0)
var enemySpriteSize = Vector2(0.0,0.0)
var cashValue = 1.0 # cash gained when this enemy dies
var coinValue = 0.0
var _temp = update_enemy_values(1.0)
var _bulletDamage : float

func _ready() -> void:
	call_deferred("set_enemy_sprite_scale", 1.0)
	#call_deferred("update_enemy_values", 0.0)
	GlobalData.enemy_values_updated.connect(update_enemy_values)

func _process(delta):
	# this logic can be time intesive. we can just remove recalculation of direction :)
	direction = (shooterContainerPosition - position).normalized()
	var distance = global_position.distance_to(shooterContainerPosition)
	# both x & y are scaled to the same value, & the original image was also of the almost equal x & t
	if(distance + 10 > shooterSpriteSize.x/2.0 + enemySpriteSize.x/2.0): 
		position += direction * speed * delta
	#TODO this position update can bring the enemy closer to where we wanna stop it
	# because it could update its position such that the new distance is < shooterSpriteSize + enemySpriteSize

func update_enemy_values(_valueModifier: float):
	_damage = GlobalData.get_enemy_damage() * _valueModifier
	_health = GlobalData.get_enemy_health() * _valueModifier
	_healthDuringBulletSpawn = _health
	cashValue = GlobalData.get_enemy_cash_value() * _valueModifier
	coinValue = GlobalData.get_enemy_coin_value() * _valueModifier

func set_direction(newDirection: Vector2, newShooterPosition: Vector2):
	direction = newDirection
	shooterContainerPosition = newShooterPosition

func set_collision_from_shooter(size: Vector2):
	shooterSpriteSize = size

func set_enemy_rotation():
	rotation = PI/2 # now the bullet is aligned along the +ve x-axis
	rotation += direction.angle()

func set_enemy_sprite_scale(_valueModifier: float):
	var enemyCollisionShape2D = $Area2D/CollisionShape2D.shape as RectangleShape2D
	enemyCollisionShape2D.size = Vector2(enemyCollisionShape2D.size.x * _valueModifier, enemyCollisionShape2D.size.y * _valueModifier)
	var enemySprite = $Area2D/Sprite2D as Sprite2D
	var correctScaleX = (enemyCollisionShape2D.size.x * 1.0) / (enemySprite.texture.get_width() * 1.0)
	var correctScaleY = (enemyCollisionShape2D.size.y * 1.0) / (enemySprite.texture.get_height() * 1.0)
	enemySprite.scale = Vector2(correctScaleX, correctScaleY)
	enemySpriteSize = enemySprite.texture.get_size() * enemySprite.scale

func on_bullet_hit(bullet: Area2D):
	if(bullet.get_parent().is_in_group("bullets")):
		# destroy enemy on bullet hit
		# health update is handled during bullet spawn in shoooter.gd :)
		#var bulletDamage = bullet.get_parent().get_current_bullet_damage()
		_update_health(_bulletDamage)
		if(_health <= 0.0):
			_play_explosion_animation()
			_play_explosion_audio()
			queue_free()
			GlobalData.update_wave_enemies_killed(+1)
			update_cash_value()
			update_coin_value()

func update_cash_value():
	GlobalData.update_cash_value(cashValue)

func update_coin_value():
	GlobalData.update_coin_value(coinValue)

func _update_health(_bulletDamage: float):
	_health -= _bulletDamage

func update_health_during_bullet_spawn(bulletDamage: float):
	_healthDuringBulletSpawn -= bulletDamage
	_bulletDamage = bulletDamage

func get_current_enemy_health():
	return _healthDuringBulletSpawn

func get_current_enemy_damage():
	return _damage

func _play_explosion_audio():
	var audioNode = $/root/GamePlay/Panel/VBoxContainer/EnemyExplosion as AudioStreamPlayer2D
	audioNode.play()

func _play_explosion_animation():
	var _explosionContainer = $/root/GamePlay/Panel/VBoxContainer/EnemyExplosionSpawner as Node2D
	var _explosionInstance = _explosionScene.instantiate() as AnimatedSprite2D
	_explosionInstance.position = position
	_explosionContainer.add_child(_explosionInstance)
	_explosionInstance.play("explode01")
