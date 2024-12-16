extends Node2D

@export var speed: float = randi_range(50, 150)  # Speed of the enemy
var direction = Vector2.ZERO  # Direction toward the center
var shooterContainerPosition : Vector2
var health: float = 1.0

func set_direction(newDirection: Vector2, newShooterPosition: Vector2):
	direction = newDirection
	shooterContainerPosition = newShooterPosition

func _process(delta):
	# this logic can be time intesive. we can just remove recalculation of direction :)
	direction = (shooterContainerPosition - position).normalized()
	position += direction * speed * delta

func _ready() -> void:
	call_deferred("_set_enemy_sprite_scale")


func _set_enemy_sprite_scale():
	var enemyCollisionShape2D = $Area2D/CollisionShape2D.shape as RectangleShape2D
	var enemySprite = $Area2D/Sprite2D as Sprite2D
	var correctScaleX = (enemyCollisionShape2D.size.x * 1.0) / (enemySprite.texture.get_width() * 1.0)
	var correctScaleY = (enemyCollisionShape2D.size.y * 1.0) / (enemySprite.texture.get_height() * 1.0)
	#print(correctScaleX, correctScaleY)
	enemySprite.scale = Vector2(correctScaleX, correctScaleY)
	
