extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	call_deferred("_update_attack_upgrade_values", 0.0)
	GlobalData.attack_upgrade_values_updated.connect(_update_attack_upgrade_values)


func _update_attack_upgrade_values(_unusedUpdateValue:float):
	# VALUES
	var damageValue = GlobalData.get_damage()
	var damageLabel = $"ScrollContainer/VBoxContainer/Attack/Damage/HBoxContainer/VBoxContainer/Value" as Label
	damageLabel.text = str("%.2f" % damageValue)
	
	var attackSpeedValue = GlobalData.get_attack_speed()
	var attackSpeedLabel = $"ScrollContainer/VBoxContainer/Attack/Speed/HBoxContainer/VBoxContainer/Value" as Label
	attackSpeedLabel.text = str("%.2f" % attackSpeedValue)
	
	var criticalChanceValue = GlobalData.get_critical_chance()
	var criticalChanceLabel = $"ScrollContainer/VBoxContainer/Critical/Chance/HBoxContainer/VBoxContainer/Value" as Label
	criticalChanceLabel.text = str("%.2f" % criticalChanceValue)
	
	var criticalFactorValue = GlobalData.get_critical_factor()
	var criticalFactorLabel = $"ScrollContainer/VBoxContainer/Critical/Factor/HBoxContainer/VBoxContainer/Value" as Label
	criticalFactorLabel.text = str("%.2f" % criticalFactorValue)
	
	# UPGRADE COST
	var damageUpgradeCostValue = GlobalData.get_damage_upgrade_cost()
	var damageUpgradeCostLabel = $"ScrollContainer/VBoxContainer/Attack/Damage/HBoxContainer/VBoxContainer/UpgradeCost" as Label
	damageUpgradeCostLabel.text = str("%.2f" % damageUpgradeCostValue)
	
	var attackSpeedUpgradeCostValue = GlobalData.get_attack_speed_upgrade_cost()
	var attackSpeedUpgradeCostLabel = $"ScrollContainer/VBoxContainer/Attack/Speed/HBoxContainer/VBoxContainer/UpgradeCost" as Label
	attackSpeedUpgradeCostLabel.text = str("%.2f" % attackSpeedUpgradeCostValue)
	
	var criticalChanceUpgradeCostValue = GlobalData.get_critical_chance_upgrade_cost()
	var criticalChanceUpgradeCostLabel = $"ScrollContainer/VBoxContainer/Critical/Chance/HBoxContainer/VBoxContainer/UpgradeCost" as Label
	criticalChanceUpgradeCostLabel.text = str("%.2f" % criticalChanceUpgradeCostValue)
	
	var criticalFactorUpgradeCostValue = GlobalData.get_critical_factor_upgrade_cost()
	var criticalFactorUpgradeCostLabel = $"ScrollContainer/VBoxContainer/Critical/Factor/HBoxContainer/VBoxContainer/UpgradeCost" as Label
	criticalFactorUpgradeCostLabel.text = str("%.2f" % criticalFactorUpgradeCostValue)

func _upgrade_damage(event: InputEvent):
	if(event is InputEventScreenTouch):
		if(event.pressed):
			if(GlobalData.get_cash_value() >= GlobalData.get_damage_upgrade_cost()):
				GlobalData.update_damage(GlobalData.get_damage_delta())
				GlobalData.update_cash_value(-GlobalData.get_damage_upgrade_cost())
				GlobalData.update_damage_upgrade_cost(10.0)
	#if(event is InputEventMouseButton or event is InputEventScreenTouch):
		#if(event.pressed and not GlobalData.get_touch_active_value()): # just pressed
			#GlobalData.update_damage(1.0)
			#GlobalData.update_touch_active_value(true)
		#elif(not event.pressed): # touch released
			#GlobalData.update_touch_active_value(false)
				

func _upgrade_attack_speed(event: InputEvent):
	if(event is InputEventScreenTouch):
		if(event.pressed):
			if(GlobalData.get_cash_value() >= GlobalData.get_attack_speed_upgrade_cost()):
				GlobalData.update_attack_speed(GlobalData.get_attack_speed_delta())
				GlobalData.update_cash_value(-GlobalData.get_attack_speed_upgrade_cost())
				GlobalData.update_attack_speed_upgrade_cost(10.0)

func _upgrade_critical_chance(event: InputEvent):
	if(event is InputEventScreenTouch):
		if(event.pressed):
			if(GlobalData.get_cash_value() >= GlobalData.get_critical_chance_upgrade_cost()):
				GlobalData.update_critical_chance(GlobalData.get_critical_chance_delta())
				GlobalData.update_cash_value(-GlobalData.get_critical_chance_upgrade_cost())
				GlobalData.update_critical_chance_upgrade_cost(10.0)

func _upgrade_critical_factor(event: InputEvent):
	if(event is InputEventScreenTouch):
		if(event.pressed):
			if(GlobalData.get_cash_value() >= GlobalData.get_critical_factor_upgrade_cost()):
				GlobalData.update_critical_factor(GlobalData.get_critical_factor_delta())
				GlobalData.update_cash_value(-GlobalData.get_critical_factor_upgrade_cost())
				GlobalData.update_critical_factor_upgrade_cost(10.0)
		
		
