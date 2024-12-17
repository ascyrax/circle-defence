extends Node2D

@export var speed: float = randi_range(50, 150)  # Speed of the enemy
var direction = Vector2.ZERO  # Direction toward the center
var shooterContainerPosition : Vector2
var health: float = 1.0
var shooterSpriteSize = Vector2(0.0,0.0)
var enemySpriteSize = Vector2(0.0,0.0)
var dollarValue = 1.0 # dollars gained when this enemy dies
var coinValue = 0.0

func set_direction(newDirection: Vector2, newShooterPosition: Vector2):
	direction = newDirection
	shooterContainerPosition = newShooterPosition

func _process(delta):
	# this logic can be time intesive. we can just remove recalculation of direction :)
	direction = (shooterContainerPosition - position).normalized()
	var distance = global_position.distance_to(shooterContainerPosition)
	# both x & y are scaled to the same value, & the original image was also of the almost equal x & t
	if(distance > shooterSpriteSize.x/2.0 + enemySpriteSize.x/2.0): 
		position += direction * speed * delta
		#TODO this position update can bring the enemy closer to where we wanna stop it
		# because it could update its position such that the new distance is < shooterSpriteSize + enemySpriteSize

func _ready() -> void:
	call_deferred("_set_enemy_sprite_scale")
	
func set_collision_from_shooter(size: Vector2):
	shooterSpriteSize = size


func _set_enemy_sprite_scale():
	var enemyCollisionShape2D = $Area2D/CollisionShape2D.shape as RectangleShape2D
	var enemySprite = $Area2D/Sprite2D as Sprite2D
	var correctScaleX = (enemyCollisionShape2D.size.x * 1.0) / (enemySprite.texture.get_width() * 1.0)
	var correctScaleY = (enemyCollisionShape2D.size.y * 1.0) / (enemySprite.texture.get_height() * 1.0)
	#print(correctScaleX, correctScaleY)
	enemySprite.scale = Vector2(correctScaleX, correctScaleY)
	enemySpriteSize = enemySprite.texture.get_size() * enemySprite.scale
	
func on_bullet_hit(bullet: Area2D):
	if(bullet.get_parent().is_in_group("bullets")):
		if(health <= 0.0):
			queue_free()
			updateDollarValue()
			#updateCoinValue()

func updateDollarValue():
	GlobalData.update_dollar_value(dollarValue)
