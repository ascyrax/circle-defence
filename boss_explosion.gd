extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	call_deferred("_temp")

func _temp():
	var _timer = $Timer as Timer
	_timer.wait_time = 2.0
	_timer.one_shot = true
	_timer.connect("timeout", _delete_explosion)
	_timer.start()

func _delete_explosion():
	queue_free()
