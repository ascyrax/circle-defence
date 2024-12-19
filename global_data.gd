extends Node

const _INITIAL_CASH_VALUE  = 80.0 # during wave 1 start
var _cashValue = _INITIAL_CASH_VALUE
var _coinValue = 0.0
var _gemValue = 0.0

#var _touchActive = false

# enemy data
var _enemySpawnInterval = 1.0
var _enemyHealth = 2.0
var _enemyDamage = 1.0
var _enemyCashValue = 1.0
var _enemyCoinValue = 0.0

# shooter data
# attack
var _damage = 1.00
var _attackSpeed = 1.00
var _criticalChance = 1.00
var _criticalFactor = 1.00
var _range = 225.00
var _damagePerMeter = 1.00

var _damageUpgradeCost = 10.00
var _attackSpeedUpgradeCost = 10.00
var _criticalChanceUpgradeCost = 10.00
var _criticalFactorUpgradeCost = 10.00
var _rangeUpgradeCost = 10.00
var _damagePerMeterUpgradeCost = 10.00

# defense
var _health = 10.00
var _healthRegeneration = 0.00
var _defensePercentage = 0.00
var _defenseAbsolute = 0.00

var _healthUpgradeCost = 10.00
var _healthRegenerationUpgradeCost = 10.00
var _defensePercentageUpgradeCost = 10.00
var _defenseAbsoluteUpgradeCost = 10.00

# utility
var _cashBonus = 1.00
var _cashPerWave = 10.00
var _coinsPerKillBonus = 1.00
var _coinsPerWave = 1.0

var _cashBonusUpgradeCost = 10.00
var _cashPerWaveUpgradeCost = 10.00
var _coinsPerKillBonusUpgradeCost = 10.00
var _coinsPerWaveUpgradeCost = 10.0

# i dont wanna make an extra function call for each bullet :)
# bullet data
#var _bulletSpeed = 700.00

signal enemy_values_updated

signal cash_value_updated
signal coin_value_updated
signal gem_value_updated

signal attack_upgrade_values_updated
signal defense_upgrade_values_updated
signal utility_upgrade_values_updated

#func get_touch_active_value():
	#return _touchActive
	#
#func update_touch_active_value(val : bool):
	#_touchActive = val


func get_cash_value():
	return _cashValue

func get_coin_value():
	return _coinValue
	
func get_gem_value():
	return _gemValue

func update_cash_value(value: float):
	_cashValue += value
	cash_value_updated.emit(_cashValue) #Emit the signal

func update_coin_value(value: float):
	_coinValue += value
	coin_value_updated.emit(_coinValue) #Emit the signal

func update_gem_value(value: float):
	_gemValue += value
	gem_value_updated.emit(_gemValue) #Emit the signal

# enemy
func get_enemy_damage():
	return _enemyDamage

func get_enemy_health():
	return _enemyHealth
	
func get_enemy_spawn_interval():
	return _enemySpawnInterval
	
func get_enemy_cash_value():
	return _enemyCashValue
	
func get_enemy_coin_value():
	return _enemySpawnInterval


func update_enemy_damage(value: float):
	_enemyDamage += value

func update_enemy_health(value: float):
	_enemyHealth += value
	
func update_enemy_spawn_interval(value: float):
	_enemySpawnInterval += value


# attack

func get_damage():
	return _damage
	
func get_attack_speed():
	return _attackSpeed

func get_critical_chance():
	return _criticalChance

func get_critical_factor():
	return _criticalFactor

func get_range():
	return _range

func get_damage_per_meter():
	return _damagePerMeter

func get_health():
	return _health
	
func get_health_regeneration():
	return _healthRegeneration

func get_defense_percentage():
	return _defensePercentage

func get_defense_absolute():
	return _defenseAbsolute

func get_cash_bonus():
	return _cashBonus

func get_cash_per_wave():
	return _cashPerWave

func get_coins_per_kill_bonus():
	return _coinsPerKillBonus

func get_coins_per_wave():
	return _coinsPerWave

func get_damage_upgrade_cost():
	return _damageUpgradeCost
	
func get_attack_speed_upgrade_cost():
	return _attackSpeedUpgradeCost

func get_critical_chance_upgrade_cost():
	return _criticalChanceUpgradeCost

func get_critical_factor_upgrade_cost():
	return _criticalFactorUpgradeCost

func get_range_upgrade_cost():
	return _rangeUpgradeCost

func get_damage_per_meter_upgrade_cost():
	return _damagePerMeterUpgradeCost

func get_health_upgrade_cost():
	return _healthUpgradeCost
	
func get_health_regeneration_upgrade_cost():
	return _healthRegenerationUpgradeCost

func get_defense_percentage_upgrade_cost():
	return _defensePercentageUpgradeCost

func get_defense_absolute_upgrade_cost():
	return _defenseAbsoluteUpgradeCost

func get_cash_bonus_upgrade_cost():
	return _cashBonusUpgradeCost

func get_cash_per_wave_upgrade_cost():
	return _cashPerWaveUpgradeCost

func get_coins_per_kill_bonus_upgrade_cost():
	return _coinsPerKillBonusUpgradeCost

func get_coins_per_wave_upgrade_cost():
	return _coinsPerWaveUpgradeCost

func update_damage(value: float):
	_damage += value
	attack_upgrade_values_updated.emit(_damage)
	
func update_attack_speed(value: float):
	_attackSpeed += value
	attack_upgrade_values_updated.emit(_attackSpeed)

func update_critical_chance(value: float):
	_criticalChance += value
	attack_upgrade_values_updated.emit(_criticalChance)

func update_critical_factor(value: float):
	_criticalFactor += value
	attack_upgrade_values_updated.emit(_criticalFactor)

func update_range(value: float):
	_range += value
	attack_upgrade_values_updated.emit(_range)

func update_damage_per_meter(value: float):
	_damagePerMeter += value
	attack_upgrade_values_updated.emit(_damagePerMeter)

func update_health(value: float):
	_health += value
	defense_upgrade_values_updated.emit(_health)

func update_health_regeneration(value: float):
	_healthRegeneration += value
	defense_upgrade_values_updated.emit(_healthRegeneration)

func update_defense_percentage(value: float):
	_defensePercentage += value
	defense_upgrade_values_updated.emit(_defensePercentage)

func update_defense_absolute(value: float):
	_defenseAbsolute += value
	defense_upgrade_values_updated.emit(_defenseAbsolute)

func update_cash_bonus(value: float):
	_cashBonus += value
	utility_upgrade_values_updated.emit(_cashBonus)

func update_cash_per_wave(value: float):
	_cashPerWave += value
	utility_upgrade_values_updated.emit(_cashPerWave)

func update_coins_per_kill_bonus(value: float):
	_coinsPerKillBonus += value
	utility_upgrade_values_updated.emit(_coinsPerKillBonus)

func update_coins_per_wave(value: float):
	_coinsPerWave += value
	utility_upgrade_values_updated.emit(_coinsPerWave)


func update_damage_upgrade_cost(value: float):
	_damageUpgradeCost += value
	attack_upgrade_values_updated.emit(_damageUpgradeCost)
	
func update_attack_speed_upgrade_cost(value: float):
	_attackSpeedUpgradeCost += value
	attack_upgrade_values_updated.emit(_attackSpeedUpgradeCost)

func update_critical_chance_upgrade_cost(value: float):
	_criticalChanceUpgradeCost += value
	attack_upgrade_values_updated.emit(_criticalChanceUpgradeCost)

func update_critical_factor_upgrade_cost(value: float):
	_criticalFactorUpgradeCost += value
	attack_upgrade_values_updated.emit(_criticalFactorUpgradeCost)

func update_range_upgrade_cost(value: float):
	_rangeUpgradeCost += value
	attack_upgrade_values_updated.emit(_rangeUpgradeCost)

func update_damage_per_meter_upgrade_cost(value: float):
	_damagePerMeterUpgradeCost += value
	attack_upgrade_values_updated.emit(_damagePerMeterUpgradeCost)

func update_health_upgrade_cost(value: float):
	_healthUpgradeCost += value
	defense_upgrade_values_updated.emit(_healthUpgradeCost)
	
func update_health_regeneration_upgrade_cost(value: float):
	_healthRegenerationUpgradeCost += value
	defense_upgrade_values_updated.emit(_healthRegenerationUpgradeCost)

func update_defense_percentage_upgrade_cost(value: float):
	_defensePercentageUpgradeCost += value
	defense_upgrade_values_updated.emit(_defensePercentageUpgradeCost)

func update_defense_absolute_upgrade_cost(value: float):
	_defenseAbsoluteUpgradeCost += value
	defense_upgrade_values_updated.emit(_defenseAbsoluteUpgradeCost)

func update_cash_bonus_upgrade_cost(value: float):
	_cashBonusUpgradeCost += value
	utility_upgrade_values_updated.emit(_cashBonusUpgradeCost)

func update_cash_per_wave_upgrade_cost(value: float):
	_cashPerWaveUpgradeCost += value
	utility_upgrade_values_updated.emit(_cashPerWaveUpgradeCost)

func update_coins_per_kill_bonus_upgrade_cost(value: float):
	_coinsPerKillBonusUpgradeCost += value
	utility_upgrade_values_updated.emit(_coinsPerKillBonusUpgradeCost)

func update_coins_per_wave_upgrade_cost(value: float):
	_coinsPerWaveUpgradeCost += value
	utility_upgrade_values_updated.emit(_coinsPerWaveUpgradeCost)
