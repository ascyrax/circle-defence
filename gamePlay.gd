extends Control

@export var enemyScene: PackedScene  # Drag your Enemy scene here
@export var shooterScene: PackedScene
var enemySpawnInterval: float = 5
var shooterContainerPosition
var shooterGlobalPosition

func _ready() -> void:
	# Defer the size calculation to ensure layout is finalized
	call_deferred("_spawn_shooter")
	call_deferred("_set_shooter_range_scale")
	call_deferred("spawn_enemies")

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
	
func _set_shooter_range_scale():
	var shooterRange = $"Panel/VBoxContainer/GamePlayNode/Shooter/Area2D/CollisionShape2D".shape as CircleShape2D
	var rangeSprite = $"Panel/VBoxContainer/GamePlayNode/Shooter/Area2D/Sprite2D" as Sprite2D
	var correctScaleX = (shooterRange.radius *2.0) / (rangeSprite.texture.get_width() * 1.0)
	var correctScaleY = (shooterRange.radius *2.0) / (rangeSprite.texture.get_height() * 1.0)
	rangeSprite.scale = Vector2(correctScaleX, correctScaleY)
	#print(rangeSprite.texture.get_size())
	#print(shooterRange.radius)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


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
