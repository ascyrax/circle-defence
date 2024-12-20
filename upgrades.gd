extends Control


func _ready() -> void:
	call_deferred("_show_attack_upgrades")
	
func _handle_attack_nav_click(event: InputEvent):
	if(event.is_pressed()):
		_show_attack_upgrades()
	
func _handle_defense_nav_click(event: InputEvent):
	if(event.is_pressed()):
		_show_defense_upgrades()

func _handle_utility_nav_click(event: InputEvent):
	if(event.is_pressed()):
		_show_utility_upgrades()
	
func _show_attack_upgrades():
	var _attackContainer = $MarginContainer/Panel/VBoxContainer/Attack as ScrollContainer
	_attackContainer.visible = true
	
	var _defenseContainer = $MarginContainer/Panel/VBoxContainer/Defense as ScrollContainer
	_defenseContainer.visible = false
	
	var _utilityContainer = $MarginContainer/Panel/VBoxContainer/Utility as ScrollContainer
	_utilityContainer.visible = false


func _show_defense_upgrades():
	var _attackContainer = $MarginContainer/Panel/VBoxContainer/Attack as ScrollContainer
	_attackContainer.visible = false
	
	var _defenseContainer = $MarginContainer/Panel/VBoxContainer/Defense as ScrollContainer
	_defenseContainer.visible = true
	
	var _utilityContainer = $MarginContainer/Panel/VBoxContainer/Utility as ScrollContainer
	_utilityContainer.visible = false
	
func _show_utility_upgrades():
	var _attackContainer = $MarginContainer/Panel/VBoxContainer/Attack as ScrollContainer
	_attackContainer.visible = false
	
	var _defenseContainer = $MarginContainer/Panel/VBoxContainer/Defense as ScrollContainer
	_defenseContainer.visible = false
	
	var _utilityContainer = $MarginContainer/Panel/VBoxContainer/Utility as ScrollContainer
	_utilityContainer.visible = true
