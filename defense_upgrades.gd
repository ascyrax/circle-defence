extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	call_deferred("_update_defense_upgrade_values", 0.0)
	GlobalData.defense_upgrade_values_updated.connect(_update_defense_upgrade_values)

func _update_defense_upgrade_values(_unusedUpdateValue:float):
	# VALUES
	var healthValue = GlobalData.get_health()
	var healthLabel = $"ScrollContainer/VBoxContainer/Health/Health/HBoxContainer/VBoxContainer/Value" as Label
	healthLabel.text = str("%.2f" % healthValue)
	
	var healthRegenerationValue = GlobalData.get_health_regeneration()
	var healthRegenerationLabel = $"ScrollContainer/VBoxContainer/Health/HealthRegeneration/HBoxContainer/VBoxContainer/Value" as Label
	healthRegenerationLabel.text = str("%.2f" % healthRegenerationValue)
	
	var criticalChanceValue = GlobalData.get_defense_percentage()
	var criticalChanceLabel = $"ScrollContainer/VBoxContainer/Defense/Percentage/HBoxContainer/VBoxContainer/Value" as Label
	criticalChanceLabel.text = str("%.2f" % criticalChanceValue)
	
	var criticalFactorValue = GlobalData.get_defense_absolute()
	var criticalFactorLabel = $"ScrollContainer/VBoxContainer/Defense/Absolute/HBoxContainer/VBoxContainer/Value" as Label
	criticalFactorLabel.text = str("%.2f" % criticalFactorValue)
	
	# UPGRADE COST
	var healthUpgradeCostValue = GlobalData.get_health_upgrade_cost()
	var healthUpgradeCostLabel = $"ScrollContainer/VBoxContainer/Health/Health/HBoxContainer/VBoxContainer/UpgradeCost" as Label
	healthUpgradeCostLabel.text = str("%.2f" % healthUpgradeCostValue)
	
	var healthRegenerationUpgradeCostValue = GlobalData.get_health_regeneration_upgrade_cost()
	var healthRegenerationUpgradeCostLabel = $"ScrollContainer/VBoxContainer/Health/HealthRegeneration/HBoxContainer/VBoxContainer/UpgradeCost" as Label
	healthRegenerationUpgradeCostLabel.text = str("%.2f" % healthRegenerationUpgradeCostValue)
	
	var defensePercentageUpgradeCostValue = GlobalData.get_defense_percentage_upgrade_cost()
	var defensePercentageUpgradeCostLabel = $"ScrollContainer/VBoxContainer/Defense/Percentage/HBoxContainer/VBoxContainer/UpgradeCost" as Label
	defensePercentageUpgradeCostLabel.text = str("%.2f" % defensePercentageUpgradeCostValue)
	
	var defenseAbsoluteUpgradeCostValue = GlobalData.get_defense_absolute_upgrade_cost()
	var defenseAbsoluteUpgradeCostLabel = $"ScrollContainer/VBoxContainer/Defense/Absolute/HBoxContainer/VBoxContainer/UpgradeCost" as Label
	defenseAbsoluteUpgradeCostLabel.text = str("%.2f" % defenseAbsoluteUpgradeCostValue)


func _upgrade_health(event: InputEvent):
	if(event is InputEventScreenTouch):
		if(event.pressed):
			if(GlobalData.get_cash_value() >= GlobalData.get_health_upgrade_cost()):
				GlobalData.update_health(5.0)
				GlobalData.update_cash_value(-GlobalData.get_health_upgrade_cost())
				GlobalData.update_health_upgrade_cost(10.0)			

func _upgrade_health_regeneration(event: InputEvent):
	if(event is InputEventScreenTouch):
		if(event.pressed):
			if(GlobalData.get_cash_value() >= GlobalData.get_health_regeneration_upgrade_cost()):
				GlobalData.update_health_regeneration(0.10)
				GlobalData.update_cash_value(-GlobalData.get_health_regeneration_upgrade_cost())
				GlobalData.update_health_regeneration_upgrade_cost(10.0)
				
func _upgrade_defense_percentage(event: InputEvent):
	if(event is InputEventScreenTouch):
		if(event.pressed):
			if(GlobalData.get_cash_value() >= GlobalData.get_defense_percentage_upgrade_cost()):
				GlobalData.update_defense_percentage(0.5)
				GlobalData.update_cash_value(-GlobalData.get_defense_percentage_upgrade_cost())
				GlobalData.update_defense_percentage_upgrade_cost(10.0)

func _upgrade_defense_absolute(event: InputEvent):
	if(event is InputEventScreenTouch):
		if(event.pressed):
			if(GlobalData.get_cash_value() >= GlobalData.get_defense_absolute_upgrade_cost()):
				GlobalData.update_defense_absolute(0.1)
				GlobalData.update_cash_value(-GlobalData.get_defense_absolute_upgrade_cost())
				GlobalData.update_defense_absolute_upgrade_cost(10.0)		
		
