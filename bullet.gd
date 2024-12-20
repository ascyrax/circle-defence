extends Node2D

@export var speed: float = 777.77
var direction:Vector2 = Vector2.ZERO
var targetEnemey: Area2D
var _damage: float 
var _temp = _update_bullet_values(0.0) # this is used to update all the values like _damage and others
# call_deferred is run after this frame, hence any other .gd files which
# are using the _damage variable will get 0.0 instead of what they actually 
# expect, ie the value after running _update_bullet_values() :)
#  we dont need to do the call_deferred to _update_bullet_values() after this :)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#call_deferred("_update_bullet_values", 0.0)
	GlobalData.attack_upgrade_values_updated.connect(_update_bullet_values)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta

func _set_direction(newDirection: Vector2):
	direction = newDirection

func _set_rotation():
	rotation = PI/2 # now the bullet is aligned along the +ve x-axis
	rotation += direction.angle()

func set_target_enemy(enemy: ):
	targetEnemey = enemy
	_set_direction((enemy.global_position - global_position).normalized())
	_set_rotation()

# on collision between the bullet and the enemy, destroy the bullet, and reduce enemy health
func on_enemy_hit(enemy: Area2D):
	if(enemy.get_parent().is_in_group("enemies") && enemy == targetEnemey):
		queue_free()

func _update_bullet_values(_unusedValue: float):
	_damage = GlobalData.get_damage()
	
func get_current_bullet_damage():
	return _damage
