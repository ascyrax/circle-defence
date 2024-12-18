extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	call_deferred("_update_utility_upgrade_values", 0.0)
	GlobalData.utility_upgrade_values_updated.connect(_update_utility_upgrade_values)

func _update_utility_upgrade_values(_unusedUpdateValue:float):
	# VALUES
	var cashBonusValue = GlobalData.get_cash_bonus()
	var cashBonusLabel = $"ScrollContainer/VBoxContainer/Cash/CashBonus/HBoxContainer/VBoxContainer/Value" as Label
	cashBonusLabel.text = str(cashBonusValue)
	
	var cashPerWaveValue = GlobalData.get_cash_per_wave()
	var cashPerWaveLabel = $"ScrollContainer/VBoxContainer/Cash/CashPerWave/HBoxContainer/VBoxContainer/Value" as Label
	cashPerWaveLabel.text = str(cashPerWaveValue)
	
	var coinsPerKillBonusValue = GlobalData.get_coins_per_kill_bonus()
	var coinsPerKillBonusLabel = $"ScrollContainer/VBoxContainer/Coin/CoinsPerKillBonus/HBoxContainer/VBoxContainer/Value" as Label
	coinsPerKillBonusLabel.text = str(coinsPerKillBonusValue)
	
	var coinsPerWaveValue = GlobalData.get_coins_per_wave()
	var coinsPerWaveLabel = $"ScrollContainer/VBoxContainer/Coin/CoinsPerWave/HBoxContainer/VBoxContainer/Value" as Label
	coinsPerWaveLabel.text = str(coinsPerWaveValue)
	
	# UPGRADE COST
	var cashBonusUpgradeCostValue = GlobalData.get_cash_bonus_upgrade_cost()
	var cashBonusUpgradeCostLabel = $"ScrollContainer/VBoxContainer/Cash/CashBonus/HBoxContainer/VBoxContainer/UpgradeCost" as Label
	cashBonusUpgradeCostLabel.text = str(cashBonusUpgradeCostValue)
	
	var cashPerWaveUpgradeCostValue = GlobalData.get_cash_per_wave_upgrade_cost()
	var cashPerWaveUpgradeCostLabel = $"ScrollContainer/VBoxContainer/Cash/CashPerWave/HBoxContainer/VBoxContainer/UpgradeCost" as Label
	cashPerWaveUpgradeCostLabel.text = str(cashPerWaveUpgradeCostValue)
	
	var coinsPerKillBonusUpgradeCostValue = GlobalData.get_coins_per_kill_bonus_upgrade_cost()
	var coinsPerKillBonusUpgradeCostLabel = $"ScrollContainer/VBoxContainer/Coin/CoinsPerKillBonus/HBoxContainer/VBoxContainer/UpgradeCost" as Label
	coinsPerKillBonusUpgradeCostLabel.text = str(coinsPerKillBonusUpgradeCostValue)
	
	var coinsPerWaveUpgradeCostValue = GlobalData.get_coins_per_wave_upgrade_cost()
	var coinsPerWaveUpgradeCostLabel = $"ScrollContainer/VBoxContainer/Coin/CoinsPerWave/HBoxContainer/VBoxContainer/UpgradeCost" as Label
	coinsPerWaveUpgradeCostLabel.text = str(coinsPerWaveUpgradeCostValue)


func _upgrade_cash_bonus(event: InputEvent):
	if(event is InputEventMouseButton or event is InputEventScreenTouch):
		if(event.pressed):
			GlobalData.update_cash_bonus(1.0)

func _upgrade_cash_per_wave(event: InputEvent):
	if(event is InputEventMouseButton or event is InputEventScreenTouch):
		if(event.pressed):
			GlobalData.update_cash_per_wave(10.0)
		
func _upgrade_coins_per_kill_bonus(event: InputEvent):
	if(event is InputEventMouseButton or event is InputEventScreenTouch):
		if(event.pressed):
			GlobalData.update_coins_per_kill_bonus(0.5)

func _upgrade_coins_per_wave(event: InputEvent):
	if(event is InputEventMouseButton or event is InputEventScreenTouch):
		if(event.pressed):
			GlobalData.update_coins_per_wave(2.0)
		
		
