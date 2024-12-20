extends Control

var _mainScene = load("res://main.tscn") as PackedScene

func _ready() -> void:
	call_deferred("_show_attack_upgrades")
	call_deferred("_render_resources", 0.0)
	GlobalData.attack_upgrade_values_updated.connect(_render_attack_upgrade_values)
	GlobalData.defense_upgrade_values_updated.connect(_render_defense_upgrade_values)
	GlobalData.utility_upgrade_values_updated.connect(_render_utility_upgrade_values)
	GlobalData.coin_value_updated.connect(_render_resources)

func _load_main_scene(event: InputEvent):
	if(event is InputEventScreenTouch):
		if(event.pressed):
			get_tree().change_scene_to_packed(_mainScene)

func _render_resources(_value: float):
	_render_coin_value(GlobalData.get_coin_value())

func _render_coin_value(value: float):
	var _coinLabel = $MarginContainer/Panel/VBoxContainer/ResourcePanel/ResourceDisplay/Coin/CoinValue as Label
	_coinLabel.text = str("%.2f" % value)


# ATTACK RENDER
func _render_attack_upgrade_values(_unusedUpdateValue:float):
	# VALUES
	var damageValue = GlobalData.get_initial_damage()
	var damageLabel = $"MarginContainer/Panel/VBoxContainer/Attack/VBoxContainer/Attack/Damage/HBoxContainer/VBoxContainer/Value" as Label
	damageLabel.text = str("%.2f" % damageValue)
	
	var attackSpeedValue = GlobalData.get_initial_attack_speed()
	var attackSpeedLabel = $"MarginContainer/Panel/VBoxContainer/Attack/VBoxContainer/Attack/Speed/HBoxContainer/VBoxContainer/Value" as Label
	attackSpeedLabel.text = str("%.2f" % attackSpeedValue)
	
	var criticalChanceValue = GlobalData.get_initial_critical_chance()
	var criticalChanceLabel = $"MarginContainer/Panel/VBoxContainer/Attack/VBoxContainer/Critical/Chance/HBoxContainer/VBoxContainer/Value" as Label
	criticalChanceLabel.text = str("%.2f" % criticalChanceValue)
	
	var criticalFactorValue = GlobalData.get_initial_critical_factor()
	var criticalFactorLabel = $"MarginContainer/Panel/VBoxContainer/Attack/VBoxContainer/Critical/Factor/HBoxContainer/VBoxContainer/Value" as Label
	criticalFactorLabel.text = str("%.2f" % criticalFactorValue)
	
	# UPGRADE COST
	var damageUpgradeCostValue = GlobalData.get_initial_damage_upgrade_cost()
	var damageUpgradeCostLabel = $"MarginContainer/Panel/VBoxContainer/Attack/VBoxContainer/Attack/Damage/HBoxContainer/VBoxContainer/UpgradeCost/Coin/CoinValue" as Label
	damageUpgradeCostLabel.text = str("%.2f" % damageUpgradeCostValue)
	
	var attackSpeedUpgradeCostValue = GlobalData.get_initial_attack_speed_upgrade_cost()
	var attackSpeedUpgradeCostLabel = $"MarginContainer/Panel/VBoxContainer/Attack/VBoxContainer/Attack/Speed/HBoxContainer/VBoxContainer/UpgradeCost/Coin/CoinValue" as Label
	attackSpeedUpgradeCostLabel.text = str("%.2f" % attackSpeedUpgradeCostValue)
	
	var criticalChanceUpgradeCostValue = GlobalData.get_initial_critical_chance_upgrade_cost()
	var criticalChanceUpgradeCostLabel = $"MarginContainer/Panel/VBoxContainer/Attack/VBoxContainer/Critical/Chance/HBoxContainer/VBoxContainer/UpgradeCost/Coin/CoinValue" as Label
	criticalChanceUpgradeCostLabel.text = str("%.2f" % criticalChanceUpgradeCostValue)
	
	var criticalFactorUpgradeCostValue = GlobalData.get_initial_critical_factor_upgrade_cost()
	var criticalFactorUpgradeCostLabel = $"MarginContainer/Panel/VBoxContainer/Attack/VBoxContainer/Critical/Factor/HBoxContainer/VBoxContainer/UpgradeCost/Coin/CoinValue" as Label
	criticalFactorUpgradeCostLabel.text = str("%.2f" % criticalFactorUpgradeCostValue)

# DEFENSE RENDER
func _render_defense_upgrade_values(_unusedUpdateValue:float):
	# VALUES
	var healthValue = GlobalData.get_initial_health()
	var healthLabel = $"MarginContainer/Panel/VBoxContainer/Defense/VBoxContainer/Health/Health/HBoxContainer/VBoxContainer/Value" as Label
	healthLabel.text = str("%.2f" % healthValue)
	
	var healthRegenerationValue = GlobalData.get_initial_health_regeneration()
	var healthRegenerationLabel = $"MarginContainer/Panel/VBoxContainer/Defense/VBoxContainer/Health/HealthRegeneration/HBoxContainer/VBoxContainer/Value" as Label
	healthRegenerationLabel.text = str("%.2f" % healthRegenerationValue)
	
	var criticalChanceValue = GlobalData.get_initial_defense_percentage()
	var criticalChanceLabel = $"MarginContainer/Panel/VBoxContainer/Defense/VBoxContainer/Defense/Percentage/HBoxContainer/VBoxContainer/Value" as Label
	criticalChanceLabel.text = str("%.2f" % criticalChanceValue)
	
	var criticalFactorValue = GlobalData.get_initial_defense_absolute()
	var criticalFactorLabel = $"MarginContainer/Panel/VBoxContainer/Defense/VBoxContainer/Defense/Absolute/HBoxContainer/VBoxContainer/Value" as Label
	criticalFactorLabel.text = str("%.2f" % criticalFactorValue)
	
	# UPGRADE COST
	var healthUpgradeCostValue = GlobalData.get_initial_health_upgrade_cost()
	var healthUpgradeCostLabel = $"MarginContainer/Panel/VBoxContainer/Defense/VBoxContainer/Health/Health/HBoxContainer/VBoxContainer/UpgradeCost/Coin/CoinValue" as Label
	healthUpgradeCostLabel.text = str("%.2f" % healthUpgradeCostValue)
	
	var healthRegenerationUpgradeCostValue = GlobalData.get_initial_health_regeneration_upgrade_cost()
	var healthRegenerationUpgradeCostLabel = $"MarginContainer/Panel/VBoxContainer/Defense/VBoxContainer/Health/HealthRegeneration/HBoxContainer/VBoxContainer/UpgradeCost/Coin/CoinValue" as Label
	healthRegenerationUpgradeCostLabel.text = str("%.2f" % healthRegenerationUpgradeCostValue)
	
	var defensePercentageUpgradeCostValue = GlobalData.get_initial_defense_percentage_upgrade_cost()
	var defensePercentageUpgradeCostLabel = $"MarginContainer/Panel/VBoxContainer/Defense/VBoxContainer/Defense/Percentage/HBoxContainer/VBoxContainer/UpgradeCost/Coin/CoinValue" as Label
	defensePercentageUpgradeCostLabel.text = str("%.2f" % defensePercentageUpgradeCostValue)
	
	var defenseAbsoluteUpgradeCostValue = GlobalData.get_initial_defense_absolute_upgrade_cost()
	var defenseAbsoluteUpgradeCostLabel = $"MarginContainer/Panel/VBoxContainer/Defense/VBoxContainer/Defense/Absolute/HBoxContainer/VBoxContainer/UpgradeCost/Coin/CoinValue" as Label
	defenseAbsoluteUpgradeCostLabel.text = str("%.2f" % defenseAbsoluteUpgradeCostValue)

# UTILITY RENDER
func _render_utility_upgrade_values(_unusedUpdateValue:float):
	# VALUES
	var cashBonusValue = GlobalData.get_initial_cash_bonus()
	var cashBonusLabel = $"MarginContainer/Panel/VBoxContainer/Utility/VBoxContainer/Cash/CashBonus/HBoxContainer/VBoxContainer/Value" as Label
	cashBonusLabel.text = str("%.2f" % cashBonusValue)
	
	var cashPerWaveValue = GlobalData.get_initial_cash_per_wave()
	var cashPerWaveLabel = $"MarginContainer/Panel/VBoxContainer/Utility/VBoxContainer/Cash/CashPerWave/HBoxContainer/VBoxContainer/Value" as Label
	cashPerWaveLabel.text = str("%.2f" % cashPerWaveValue)
	
	var coinsPerKillBonusValue = GlobalData.get_initial_coins_per_kill_bonus()
	var coinsPerKillBonusLabel = $"MarginContainer/Panel/VBoxContainer/Utility/VBoxContainer/Coin/CoinPerKillBonus/HBoxContainer/VBoxContainer/Value" as Label
	coinsPerKillBonusLabel.text = str("%.2f" % coinsPerKillBonusValue)
	
	var coinsPerWaveValue = GlobalData.get_initial_coins_per_wave()
	var coinsPerWaveLabel = $"MarginContainer/Panel/VBoxContainer/Utility/VBoxContainer/Coin/CoinPerWave/HBoxContainer/VBoxContainer/Value" as Label
	coinsPerWaveLabel.text = str("%.2f" % coinsPerWaveValue)
	
	# UPGRADE COST
	var cashBonusUpgradeCostValue = GlobalData.get_initial_cash_bonus_upgrade_cost()
	var cashBonusUpgradeCostLabel = $"MarginContainer/Panel/VBoxContainer/Utility/VBoxContainer/Cash/CashBonus/HBoxContainer/VBoxContainer/UpgradeCost/Coin/CoinValue" as Label
	cashBonusUpgradeCostLabel.text = str("%.2f" % cashBonusUpgradeCostValue)
	
	var cashPerWaveUpgradeCostValue = GlobalData.get_initial_cash_per_wave_upgrade_cost()
	var cashPerWaveUpgradeCostLabel = $"MarginContainer/Panel/VBoxContainer/Utility/VBoxContainer/Cash/CashPerWave/HBoxContainer/VBoxContainer/UpgradeCost/Coin/CoinValue" as Label
	cashPerWaveUpgradeCostLabel.text = str("%.2f" % cashPerWaveUpgradeCostValue)
	
	var coinsPerKillBonusUpgradeCostValue = GlobalData.get_initial_coins_per_kill_bonus_upgrade_cost()
	var coinsPerKillBonusUpgradeCostLabel = $"MarginContainer/Panel/VBoxContainer/Utility/VBoxContainer/Coin/CoinPerKillBonus/HBoxContainer/VBoxContainer/UpgradeCost/Coin/CoinValue" as Label
	coinsPerKillBonusUpgradeCostLabel.text = str("%.2f" % coinsPerKillBonusUpgradeCostValue)
	
	var coinsPerWaveUpgradeCostValue = GlobalData.get_initial_coins_per_wave_upgrade_cost()
	var coinsPerWaveUpgradeCostLabel = $"MarginContainer/Panel/VBoxContainer/Utility/VBoxContainer/Coin/CoinPerWave/HBoxContainer/VBoxContainer/UpgradeCost/Coin/CoinValue" as Label
	coinsPerWaveUpgradeCostLabel.text = str("%.2f" % coinsPerWaveUpgradeCostValue)


# ATTACK UPGRADES ON PURCHASE

func _upgrade_initial_damage(event: InputEvent):
	if(event is InputEventScreenTouch):
		if(event.pressed):
			if(GlobalData.get_coin_value() >= GlobalData.get_initial_damage_upgrade_cost()):
				GlobalData.update_initial_damage(0.25)
				GlobalData.update_coin_value(-GlobalData.get_initial_damage_upgrade_cost())
				GlobalData.update_initial_damage_upgrade_cost(10.0)

func _upgrade_initial_attack_speed(event: InputEvent):
	if(event is InputEventScreenTouch):
		if(event.pressed):
			if(GlobalData.get_coin_value() >= GlobalData.get_initial_attack_speed_upgrade_cost()):
				GlobalData.update_initial_attack_speed(0.1)
				GlobalData.update_coin_value(-GlobalData.get_initial_attack_speed_upgrade_cost())
				GlobalData.update_initial_attack_speed_upgrade_cost(10.0)

func _upgrade_initial_critical_chance(event: InputEvent):
	if(event is InputEventScreenTouch):
		if(event.pressed):
			if(GlobalData.get_coin_value() >= GlobalData.get_initial_critical_chance_upgrade_cost()):
				GlobalData.update_initial_critical_chance(1.0)
				GlobalData.update_coin_value(-GlobalData.get_initial_critical_chance_upgrade_cost())
				GlobalData.update_initial_critical_chance_upgrade_cost(10.0)

func _upgrade_initial_critical_factor(event: InputEvent):
	if(event is InputEventScreenTouch):
		if(event.pressed):
			if(GlobalData.get_coin_value() >= GlobalData.get_initial_critical_factor_upgrade_cost()):
				GlobalData.update_initial_critical_factor(0.1)
				GlobalData.update_coin_value(-GlobalData.get_initial_critical_factor_upgrade_cost())
				GlobalData.update_initial_critical_factor_upgrade_cost(10.0)


# DEFENSE UPGRADES ON PURCHASE
func _upgrade_initial_health(event: InputEvent):
	if(event is InputEventScreenTouch):
		if(event.pressed):
			if(GlobalData.get_coin_value() >= GlobalData.get_health_upgrade_cost()):
				GlobalData.update_initial_health(5.0)
				GlobalData.update_coin_value(-GlobalData.get_health_upgrade_cost())
				GlobalData.update_initial_health_upgrade_cost(10.0)			

func _upgrade_initial_health_regeneration(event: InputEvent):
	if(event is InputEventScreenTouch):
		if(event.pressed):
			if(GlobalData.get_coin_value() >= GlobalData.get_health_regeneration_upgrade_cost()):
				GlobalData.update_initial_health_regeneration(0.10)
				GlobalData.update_coin_value(-GlobalData.get_health_regeneration_upgrade_cost())
				GlobalData.update_initial_health_regeneration_upgrade_cost(10.0)
				
func _upgrade_initial_defense_percentage(event: InputEvent):
	if(event is InputEventScreenTouch):
		if(event.pressed):
			if(GlobalData.get_coin_value() >= GlobalData.get_defense_percentage_upgrade_cost()):
				GlobalData.update_initial_defense_percentage(0.5)
				GlobalData.update_coin_value(-GlobalData.get_defense_percentage_upgrade_cost())
				GlobalData.update_initial_defense_percentage_upgrade_cost(10.0)

func _upgrade_initial_defense_absolute(event: InputEvent):
	if(event is InputEventScreenTouch):
		if(event.pressed):
			if(GlobalData.get_coin_value() >= GlobalData.get_defense_absolute_upgrade_cost()):
				GlobalData.update_initial_defense_absolute(0.1)
				GlobalData.update_coin_value(-GlobalData.get_defense_absolute_upgrade_cost())
				GlobalData.update_initial_defense_absolute_upgrade_cost(10.0)		
		



# UTILITY UPGRADES ON PURCHASE

func _upgrade_initial_cash_bonus(event: InputEvent):
	if(event is InputEventScreenTouch):
		if(event.pressed):
			if(GlobalData.get_coin_value() >= GlobalData.get_cash_bonus()):
				GlobalData.update_initial_cash_bonus(1.0)
				GlobalData.update_coin_value(-GlobalData.get_cash_bonus())
				GlobalData.update_initial_cash_bonus_upgrade_cost(10.0)			


func _upgrade_initial_cash_per_wave(event: InputEvent):
	if(event is InputEventScreenTouch):
		if(event.pressed):
			if(GlobalData.get_coin_value() >= GlobalData.get_cash_per_wave()):
				GlobalData.update_initial_cash_per_wave(10.0)
				GlobalData.update_coin_value(-GlobalData.get_cash_per_wave())
				GlobalData.update_initial_cash_per_wave_upgrade_cost(10.0)			

func _upgrade_initial_coins_per_kill_bonus(event: InputEvent):
	if(event is InputEventScreenTouch):
		if(event.pressed):
			if(GlobalData.get_coin_value() >= GlobalData.get_coins_per_kill_bonus()):
				GlobalData.update_initial_coins_per_kill_bonus(0.25)
				GlobalData.update_coin_value(-GlobalData.get_coins_per_kill_bonus())
				GlobalData.update_initial_coins_per_kill_bonus_upgrade_cost(10.0)			


func _upgrade_initial_coins_per_wave(event: InputEvent):
	if(event is InputEventScreenTouch):
		if(event.pressed):
			if(GlobalData.get_coin_value() >= GlobalData.get_coins_per_wave()):
				GlobalData.update_initial_coins_per_wave(10.0)
				GlobalData.update_coin_value(-GlobalData.get_coins_per_wave())
				GlobalData.update_initial_coins_per_wave_upgrade_cost(10.0)			







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
	_render_attack_upgrade_values(0.0)
	
	var _defenseContainer = $MarginContainer/Panel/VBoxContainer/Defense as ScrollContainer
	_defenseContainer.visible = false
	
	var _utilityContainer = $MarginContainer/Panel/VBoxContainer/Utility as ScrollContainer
	_utilityContainer.visible = false

func _show_defense_upgrades():
	var _attackContainer = $MarginContainer/Panel/VBoxContainer/Attack as ScrollContainer
	_attackContainer.visible = false
	
	var _defenseContainer = $MarginContainer/Panel/VBoxContainer/Defense as ScrollContainer
	_defenseContainer.visible = true
	_render_defense_upgrade_values(0.0)
	
	
	var _utilityContainer = $MarginContainer/Panel/VBoxContainer/Utility as ScrollContainer
	_utilityContainer.visible = false
	
func _show_utility_upgrades():
	var _attackContainer = $MarginContainer/Panel/VBoxContainer/Attack as ScrollContainer
	_attackContainer.visible = false
	
	var _defenseContainer = $MarginContainer/Panel/VBoxContainer/Defense as ScrollContainer
	_defenseContainer.visible = false
	
	var _utilityContainer = $MarginContainer/Panel/VBoxContainer/Utility as ScrollContainer
	_utilityContainer.visible = true
	_render_utility_upgrade_values(0.0)
	
