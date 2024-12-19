extends Node2D

@export var speed: float = randi_range(50, 150)  # Speed of the enemy
var direction = Vector2.ZERO  # Direction toward the center
var shooterContainerPosition : Vector2
var _health: float = 1.0
var damage: float = 1.0
var shooterSpriteSize = Vector2(0.0,0.0)
var enemySpriteSize = Vector2(0.0,0.0)
var cashValue = 1.0 # cash gained when this enemy dies
var coinValue = 0.0
var _updater_temp = _update_enemy_values(0.0)

func _ready() -> void:
	call_deferred("_set_enemy_sprite_scale")
	#call_deferred("_update_enemy_values", 0.0)
	GlobalData.enemy_values_updated.connect(_update_enemy_values)

func _process(delta):
	# this logic can be time intesive. we can just remove recalculation of direction :)
	direction = (shooterContainerPosition - position).normalized()
	var distance = global_position.distance_to(shooterContainerPosition)
	# both x & y are scaled to the same value, & the original image was also of the almost equal x & t
	if(distance > shooterSpriteSize.x/2.0 + enemySpriteSize.x/2.0): 
		position += direction * speed * delta
		#TODO this position update can bring the enemy closer to where we wanna stop it
		# because it could update its position such that the new distance is < shooterSpriteSize + enemySpriteSize

func _update_enemy_values(unusedValue: float):
	damage = GlobalData.get_enemy_damage()
	_health = GlobalData.get_enemy_health()
	cashValue = GlobalData.get_enemy_cash_value()
	coinValue = GlobalData.get_enemy_coin_value()

func set_direction(newDirection: Vector2, newShooterPosition: Vector2):
	direction = newDirection
	shooterContainerPosition = newShooterPosition

func set_collision_from_shooter(size: Vector2):
	shooterSpriteSize = size

func _set_enemy_sprite_scale():
	var enemyCollisionShape2D = $Area2D/CollisionShape2D.shape as RectangleShape2D
	var enemySprite = $Area2D/Sprite2D as Sprite2D
	var correctScaleX = (enemyCollisionShape2D.size.x * 1.0) / (enemySprite.texture.get_width() * 1.0)
	var correctScaleY = (enemyCollisionShape2D.size.y * 1.0) / (enemySprite.texture.get_height() * 1.0)
	enemySprite.scale = Vector2(correctScaleX, correctScaleY)
	enemySpriteSize = enemySprite.texture.get_size() * enemySprite.scale

func on_bullet_hit(bullet: Area2D):
	if(bullet.get_parent().is_in_group("bullets")):
		if(_health <= 0.0):
			queue_free()
			update_cash_value()
			#update_coin_value()

func update_cash_value():
	GlobalData.update_cash_value(cashValue)

func update_health_on_bullet_hit(bulletDamage: float):
	_health -= bulletDamage

func get_current_enemy_health():
	return _health
