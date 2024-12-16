extends Node2D

@export var bulletScene: PackedScene
var enemiesInRange: Array
var attackRate: float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	call_deferred("_add_bullet_timer")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _add_bullet_timer():
	var bulletSpawnTimer = Timer.new()
	add_child(bulletSpawnTimer)
	bulletSpawnTimer.wait_time = 1.0 / attackRate
	bulletSpawnTimer.one_shot = false
	bulletSpawnTimer.connect("timeout", _spawn_bullet)
	bulletSpawnTimer.start()

func _enemy_in_shooting_radius(area: Area2D) -> void:
	enemiesInRange.append(area)
	
func _spawn_bullet():
	# do this only if an enemy exist within the range
	if(enemiesInRange.size()):
		var bullet = bulletScene.instantiate()
		add_child(bullet)
