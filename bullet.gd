extends Node2D

@export var speed: float = 150.0
var direction:Vector2 = Vector2.ZERO
var targetEnemey: Area2D
var damage: float 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta

func _set_direction(newDirection: Vector2):
	print("set_direction: ", newDirection)
	direction = newDirection

func set_target_enemy(enemy: Area2D):
	targetEnemey = enemy
	_set_direction((enemy.global_position - global_position).normalized())

	
# on collision between the bullet and the enemy, destroy the bullet, and reduce enemy health
