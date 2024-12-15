extends Control

@export var enemyScene: PackedScene  # Drag your Enemy scene here
var enemySpawnInterval: float = 5
var shooterContainer: Control
var shooter:Sprite2D
var shooterContainerPosition

func _ready() -> void:
	# Defer the size calculation to ensure layout is finalized
	call_deferred("_set_shooter_location")
	call_deferred("_set_shooter_range_scale")
	spawn_enemies()

func _set_shooter_location():
	shooterContainer = $"Panel/VBoxContainer/GamePlayNode" as Control # this is the parent node 'GamePlay' (Control)
	print("shooterContainer position: ", shooterContainer.position)
	print("shooterContainer bottom-right position: ", shooterContainer.get_rect())
	shooterContainer.position = (shooterContainer.get_rect().size + shooterContainer.position) / 2 # place the shooter at the middle of its parent node container
	shooterContainerPosition = shooterContainer.position
	#shooter is placed (0,0) corresponding to this position :)
	print("shooterContainer new position: ",shooterContainer.position)
		
func _set_shooter_range_scale():
	var shooterRange = $"Panel/VBoxContainer/GamePlayNode/Central Shooter/Area2D/CollisionShape2D".shape as CircleShape2D
	shooter = $"Panel/VBoxContainer/GamePlayNode/Central Shooter/Area2D/Sprite2D" as Sprite2D
	var correctScaleX = (shooterRange.radius *2.0) / (shooter.texture.get_width() * 1.0)
	var correctScaleY = (shooterRange.radius *2.0) / (shooter.texture.get_height() * 1.0)
	shooter.scale = Vector2(correctScaleX, correctScaleY)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func spawn_enemies():
	print("spawn_enemies")
	# set a timer
	var enemySpawnTimer = Timer.new()
	add_child(enemySpawnTimer)
	enemySpawnTimer.wait_time = enemySpawnInterval
	enemySpawnTimer.one_shot= false
	enemySpawnTimer.connect("timeout", _spawn_enemy)
	enemySpawnTimer.start()
	
	# make the enemies move towards the shooterPosition
	# do this in _process
	
	
func _spawn_enemy():
	print("_spawn_enemy")
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
	print("posX: ",posX, " posY: ",posY)
	newEnemy.position = Vector2(posX, posY)
	
	print("shooterContainer position: ", shooterContainerPosition)
	print("enemy position: ", newEnemy.position)
	
	 # Set the direction toward the centreShooterSprite2D
	if newEnemy.has_method("set_direction"):
		var direction = (shooterContainerPosition - newEnemy.position).normalized()
		newEnemy.set_direction(direction)
		print("direction: ", direction)
