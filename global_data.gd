extends Node


# RESOURCES

const _initialCashValue  = 10.0 # during wave 1 start
const _initialCoinValue  = 0.0 # during game start

var _cashValue = _initialCashValue
var _coinValue = _initialCoinValue
var _gemValue = 0.0

# WAVE 
const _initialWaveNumber = 1.0
const _initialHighestWave = 0.0
const _baseEnemySpawnPerWave = 10.0

var _waveNumber = _initialWaveNumber
var _highestWave = _initialHighestWave
var _waveEnemiesSpawned = 0.0
var _waveEnemiesKilled = 0.0
var _totalEnemySpawnsPerWave = _baseEnemySpawnPerWave


# enemy data
# INITIAL ENEMY DATA
var _initialEnemySpawnInterval = 1
var _initialEnemyHealth = 1.0
var _initialEnemyDamage = 1.0
var _initialEnemyCashValue = 1.0
var _initialEnemyCoinValue = 0.1

var _enemySpawnInterval = 1
var _enemyHealth = 1.0
var _enemyDamage = 1.0
var _enemyCashValue = 1.0
var _enemyCoinValue = 0.1

# shooter data
# attack
var _initialDamage = 1.00
var _initialAttackSpeed = 1.00
var _initialCriticalChance = 1.00
var _initialCriticalFactor = 1.00
var _initialRange = 225.00
var _initialDamagePerMeter = 1.00

var _damage = 1.00
var _attackSpeed = 1.00
var _criticalChance = 1.00
var _criticalFactor = 1.00
var _range = 225.00
var _damagePerMeter = 1.00

var _initialDamageUC = 10.00
var _initialAttackSpeedUC = 10.00
var _initialCriticalChanceUC = 10.00
var _initialCriticalFactorUC = 10.00
var _initialRangeUC = 10.00
var _initialDamagePerMeterUC = 10.00

var _damageUC = 10.00
var _attackSpeedUC = 10.00
var _criticalChanceUC = 10.00
var _criticalFactorUC = 10.00
var _rangeUC = 10.00
var _damagePerMeterUC = 10.00

var _damageDelta = 0.5
var _attackSpeedDelta = 0.1
var _criticalChanceDelta = 1.00
var _criticalFactorDelta = 0.1
var _rangeDelta = 5.0 # in pixels :)
var _damagePerMeterDelta = 0.5 # TODO


# defense

var _initialHealth = 10.00
var _initialHealthRegeneration = 0.00
var _initialDefensePercentage = 0.00
var _initialDefenseAbsolute = 0.00

var _health = 10.00
var _healthRegeneration = 0.00
var _defensePercentage = 0.00
var _defenseAbsolute = 0.00

var _initialHealthUC = 10.00
var _initialHealthRegenerationUC = 10.00
var _initialDefensePercentageUC = 10.00
var _initialDefenseAbsoluteUC = 10.00

var _healthUC = 10.00
var _healthRegenerationUC = 10.00
var _defensePercentageUC = 10.00
var _defenseAbsoluteUC = 10.00

var _healthDelta = 5.00
var _healthRegenerationDelta = 0.10
var _defensePercentageDelta = 1.0
var _defenseAbsoluteDelta = 0.5

# utility
var _initialCashBonus = 1.00
var _initialCashPerWave = 10.00
var _initialCoinsPerKillBonus = 1.00
var _initialCoinsPerWave = 10.0

var _cashBonus = 1.00
var _cashPerWave = 10.00
var _coinsPerKillBonus = 1.00
var _coinsPerWave = 1.0

var _initialCashBonusUC = 10.00
var _initialCashPerWaveUC = 10.00
var _initialCoinsPerKillBonusUC = 10.00
var _initialCoinsPerWaveUC = 10.0

var _cashBonusUC = 10.00
var _cashPerWaveUC = 10.00
var _coinsPerKillBonusUC = 10.00
var _coinsPerWaveUC = 10.0

var _cashBonusDelta = 1.00
var _cashPerWaveDelta = 10.00
var _coinsPerKillBonusDelta = 0.25
var _coinsPerWaveDelta = 10.0

signal wave_enemies_spawned
signal wave_enemies_killed
signal wave_changed
signal game_over

signal enemy_values_updated

signal cash_value_updated
signal coin_value_updated
signal gem_value_updated

signal attack_upgrade_values_updated
signal defense_upgrade_values_updated
signal utility_upgrade_values_updated

signal health_regeneration_value_updated


















func reset_game_play_values():
	#resources
	_cashValue = _initialCashValue
	
	# wave
	_waveNumber = 1
	_waveEnemiesSpawned = 0
	_waveEnemiesKilled = 0
	
	# enemy data
	_enemySpawnInterval = _initialEnemySpawnInterval
	_enemyHealth = _initialEnemyHealth
	_enemyDamage = _initialEnemyDamage
	_enemyCashValue = _initialEnemyCashValue
	_enemyCoinValue = _initialEnemyCoinValue
	
	# shooter data
	# attack
	_damage = _initialDamage
	_attackSpeed = _initialAttackSpeed
	_criticalChance = _initialCriticalChance
	_criticalFactor = _initialCriticalFactor
	_range = _initialRange
	_damagePerMeter= _initialDamagePerMeter 

	#_damageUC = _initialDamageUC
	#_attackSpeedUC = _initialAttackSpeedUC
	#_criticalChanceUC = _initialCriticalChanceUC
	#_criticalFactorUC = _initialCriticalFactorUC
	#_rangeUC = _initialRangeUC
	#_damagePerMeterUC= _initialDamagePerMeterUC
	
	_damageUC = 10.00
	_attackSpeedUC = 10.00
	_criticalChanceUC = 10.00
	_criticalFactorUC = 10.00
	_rangeUC = 10.00
	_damagePerMeterUC = 10.00

	# defense
	_health = _initialHealth
	_healthRegeneration = _initialHealthRegeneration
	_defensePercentage = _initialDefensePercentage
	_defenseAbsolute= _initialDefenseAbsolute

	_healthUC = _initialHealthUC
	_healthRegenerationUC = _initialHealthRegenerationUC
	_defensePercentageUC = _initialDamagePerMeterUC
	_defenseAbsoluteUC= _initialDefenseAbsoluteUC
	
	_healthUC = 10.00
	_healthRegenerationUC = 10.00
	_defensePercentageUC = 10.00
	_defenseAbsoluteUC = 10.00

	# utility
	_cashBonus = _initialCashBonus
	_cashPerWave = _initialCashPerWave
	_coinsPerKillBonus = _initialCoinsPerKillBonus
	_coinsPerWave= _initialCoinsPerWave

	_cashBonusUC = _initialCashBonusUC
	_cashPerWaveUC = _initialCashPerWaveUC
	_coinsPerKillBonusUC = _initialCoinsPerKillBonusUC
	_coinsPerWaveUC= _initialCoinsPerWaveUC
	
	_cashBonusUC = 10.00
	_cashPerWaveUC = 10.00
	_coinsPerKillBonusUC = 10.00
	_coinsPerWaveUC = 10.0

func get_total_enemy_spawns_per_wave():
	return _totalEnemySpawnsPerWave + _waveNumber

func get_wave_enemies_spawned():
	return _waveEnemiesSpawned

func update_wave_enemies_spawned(value : float):
	_waveEnemiesSpawned += value
	if(_waveEnemiesSpawned == get_total_enemy_spawns_per_wave()):
		wave_enemies_spawned.emit(_waveEnemiesSpawned)
		
func set_wave_enemies_spawned(value: float):
	_waveEnemiesSpawned = value

func get_wave_enemies_killed():
	return _waveEnemiesKilled

func update_wave_enemies_killed(value : float):
	_waveEnemiesKilled += value
	if(_waveEnemiesKilled == get_total_enemy_spawns_per_wave()):
		wave_enemies_killed.emit(_waveEnemiesKilled)

func set_wave_enemies_killed(value: float):
	_waveEnemiesKilled = value

func get_wave_number():
	return _waveNumber
	
func update_wave_number(value: float):
	_waveNumber += value
	_highestWave = max(_highestWave, _waveNumber)
	
	update_cash_value(get_cash_per_wave())
	update_coin_value(get_coins_per_wave())
	
	wave_changed.emit(_waveNumber)
	enemy_values_updated.emit(_waveNumber)

func get_highest_wave():
	return _highestWave
























# RESOURCES

func get_cash_value():
	return _cashValue

func update_cash_value(value: float):
	_cashValue += value
	cash_value_updated.emit(_cashValue) #Emit the signal
	
func get_coin_value():
	return _coinValue

func update_coin_value(value: float):
	_coinValue += value
	coin_value_updated.emit(_coinValue) #Emit the signal
	
func get_gem_value():
	return _gemValue

func update_gem_value(value: float):
	_gemValue += value
	gem_value_updated.emit(_gemValue) #Emit the signal
















# enemy

func get_enemy_damage():
	return _enemyDamage * _waveNumber

func update_enemy_damage(value: float):
	_enemyDamage += value

func set_enemy_damage(value: float):
	_enemyDamage = value

func get_initial_enemy_damage():
	return _initialEnemyDamage;

func update_initial_enemy_damage(value: float):
	_initialEnemyDamage += value

func set_initial_enemy_damage(value: float):
	_initialEnemyDamage = value	
	
	
	
	
func get_enemy_health():
	return _enemyHealth * _waveNumber

func update_enemy_health(value: float):
	_enemyHealth += value

func set_enemy_health(value: float):
	_enemyHealth = value

func get_initial_enemy_health():
	return _initialEnemyHealth

func update_initial_enemy_health(value: float):
	_initialEnemyHealth += value
	
func set_initial_enemy_health(value: float):
	_initialEnemyHealth = value




func get_enemy_spawn_interval():
	return _enemySpawnInterval
	
func update_enemy_spawn_interval(value: float):
	_enemySpawnInterval += value

func set_enemy_spawn_interval(value: float):
	_enemySpawnInterval = value


	
func get_enemy_cash_value():
	return _enemyCashValue * _waveNumber
	
func get_enemy_coin_value():
	return _enemyCoinValue * _waveNumber















# attack

func get_damage():
	return _damage
	
func update_damage(value: float):
	_damage += value
	attack_upgrade_values_updated.emit(_damage)

func set_damage(value: float):
	_damage += value
	attack_upgrade_values_updated.emit(_damage)

func get_initial_damage():
	return _initialDamage
	
func update_initial_damage(value: float):
	_initialDamage += value
	attack_upgrade_values_updated.emit(_damage)

func set_initial_damage(value: float):
	_initialDamage += value
	attack_upgrade_values_updated.emit(_damage)

func get_damage_delta():
	return _damageDelta




func get_attack_speed():
	return _attackSpeed
	
func update_attack_speed(value: float):
	_attackSpeed += value
	attack_upgrade_values_updated.emit(_attackSpeed)	

func set_attack_speed(value: float):
	_attackSpeed = value
	attack_upgrade_values_updated.emit(_attackSpeed)	

func get_initial_attack_speed():
	return _initialAttackSpeed
	
func update_initial_attack_speed(value: float):
	_initialAttackSpeed += value
	attack_upgrade_values_updated.emit(_initialAttackSpeed)	

func set_initial_attack_speed(value: float):
	_initialAttackSpeed = value
	attack_upgrade_values_updated.emit(_initialAttackSpeed)	

func get_attack_speed_delta():
	return _attackSpeedDelta




func get_critical_chance():
	return _criticalChance

func update_critical_chance(value: float):
	_criticalChance += value
	attack_upgrade_values_updated.emit(_criticalChance)

func set_critical_chance(value: float):
	_criticalChance = value
	attack_upgrade_values_updated.emit(_criticalChance)

func get_initial_critical_chance():
	return _initialCriticalChance

func update_initial_critical_chance(value: float):
	_initialCriticalChance += value
	attack_upgrade_values_updated.emit(_initialCriticalChance)

func set_initial_critical_chance(value: float):
	_initialCriticalChance = value
	attack_upgrade_values_updated.emit(_initialCriticalChance)

func get_critical_chance_delta():
	return _criticalChanceDelta




func get_critical_factor():
	return _criticalFactor

func update_critical_factor(value: float):
	_criticalFactor += value
	attack_upgrade_values_updated.emit(_criticalFactor)

func set_critical_factor(value: float):
	_criticalFactor = value
	attack_upgrade_values_updated.emit(_criticalFactor)

func get_initial_critical_factor():
	return _initialCriticalFactor

func update_initial_critical_factor(value: float):
	_initialCriticalFactor += value
	attack_upgrade_values_updated.emit(_initialCriticalFactor)

func set_initial_critical_factor(value: float):
	_initialCriticalFactor = value
	attack_upgrade_values_updated.emit(_initialCriticalFactor)

func get_critical_factor_delta():
	return _criticalFactorDelta



func get_range():
	return _range

func update_range(value: float):
	_range += value
	attack_upgrade_values_updated.emit(_range)

func set_range(value: float):
	_range = value
	attack_upgrade_values_updated.emit(_range)
	
func get_initial_range():
	return _initialRange

func update_initial_range(value: float):
	_initialRange += value
	attack_upgrade_values_updated.emit(_initialRange)

func set_initial_range(value: float):
	_initialRange = value
	attack_upgrade_values_updated.emit(_initialRange)

func get_range_delta():
	return _rangeDelta





func get_damage_per_meter():
	return _damagePerMeter
	
func update_damage_per_meter(value: float):
	_damagePerMeter += value
	attack_upgrade_values_updated.emit(_damagePerMeter)

func set_damage_per_meter(value: float):
	_damagePerMeter = value
	attack_upgrade_values_updated.emit(_damagePerMeter)

func get_initial_damage_per_meter():
	return _initialDamagePerMeter
	
func update_initial_damage_per_meter(value: float):
	_initialDamagePerMeter += value
	attack_upgrade_values_updated.emit(_initialDamagePerMeter)

func set_initial_damage_per_meter(value: float):
	_initialDamagePerMeter = value
	attack_upgrade_values_updated.emit(_initialDamagePerMeter)

func get_damage_per_meter_delta():
	return _damagePerMeterDelta








# attack upgrade cost

func get_damage_upgrade_cost():
	return _damageUC
	
func update_damage_upgrade_cost(value: float):
	_damageUC += value
	attack_upgrade_values_updated.emit(_damageUC)

func set_damage_upgrade_cost(value: float):
	_damageUC = value
	attack_upgrade_values_updated.emit(_damageUC)

func get_initial_damage_upgrade_cost():
	return _initialDamageUC
	
func update_initial_damage_upgrade_cost(value: float):
	_initialDamageUC += value
	attack_upgrade_values_updated.emit(_initialDamageUC)

func set_initial_damage_upgrade_cost(value: float):
	_initialDamageUC = value
	attack_upgrade_values_updated.emit(_initialDamageUC)




func get_attack_speed_upgrade_cost():
	return _attackSpeedUC

func update_attack_speed_upgrade_cost(value: float):
	_attackSpeedUC += value
	attack_upgrade_values_updated.emit(_attackSpeedUC)

func set_attack_speed_upgrade_cost(value: float):
	_attackSpeedUC = value
	attack_upgrade_values_updated.emit(_attackSpeedUC)

func get_initial_attack_speed_upgrade_cost():
	return _initialAttackSpeedUC

func update_initial_attack_speed_upgrade_cost(value: float):
	_initialAttackSpeedUC += value
	attack_upgrade_values_updated.emit(_initialAttackSpeedUC)

func set_initial_attack_speed_upgrade_cost(value: float):
	_initialAttackSpeedUC = value
	attack_upgrade_values_updated.emit(_initialAttackSpeedUC)










func get_critical_chance_upgrade_cost():
	return _criticalChanceUC

func update_critical_chance_upgrade_cost(value: float):
	_criticalChanceUC += value
	attack_upgrade_values_updated.emit(_criticalChanceUC)

func set_critical_chance_upgrade_cost(value: float):
	_criticalChanceUC = value
	attack_upgrade_values_updated.emit(_criticalChanceUC)

func get_initial_critical_chance_upgrade_cost():
	return _initialCriticalChanceUC

func update_initial_critical_chance_upgrade_cost(value: float):
	_initialCriticalChanceUC += value
	attack_upgrade_values_updated.emit(_initialCriticalChanceUC)

func set_initial_critical_chance_upgrade_cost(value: float):
	_initialCriticalChanceUC = value
	attack_upgrade_values_updated.emit(_initialCriticalChanceUC)






func get_critical_factor_upgrade_cost():
	return _criticalFactorUC

func update_critical_factor_upgrade_cost(value: float):
	_criticalFactorUC += value
	attack_upgrade_values_updated.emit(_criticalFactorUC)

func set_critical_factor_upgrade_cost(value: float):
	_criticalFactorUC = value
	attack_upgrade_values_updated.emit(_criticalFactorUC)

func get_initial_critical_factor_upgrade_cost():
	return _initialCriticalFactorUC

func update_initial_critical_factor_upgrade_cost(value: float):
	_initialCriticalFactorUC += value
	attack_upgrade_values_updated.emit(_initialCriticalFactorUC)

func set_initial_critical_factor_upgrade_cost(value: float):
	_initialCriticalFactorUC = value
	attack_upgrade_values_updated.emit(_initialCriticalFactorUC)




func get_range_upgrade_cost():
	return _rangeUC

func update_range_upgrade_cost(value: float):
	_rangeUC += value
	attack_upgrade_values_updated.emit(_rangeUC)

func set_range_upgrade_cost(value: float):
	_rangeUC = value
	attack_upgrade_values_updated.emit(_rangeUC)

func get_initial_range_upgrade_cost():
	return _initialRangeUC

func update_initial_range_upgrade_cost(value: float):
	_initialRangeUC += value
	attack_upgrade_values_updated.emit(_initialRangeUC)

func set_initial_range_upgrade_cost(value: float):
	_initialRangeUC = value
	attack_upgrade_values_updated.emit(_initialRangeUC)




	
func get_damage_per_meter_upgrade_cost():
	return _damagePerMeterUC

func update_damage_per_meter_upgrade_cost(value: float):
	_damagePerMeterUC += value
	attack_upgrade_values_updated.emit(_damagePerMeterUC)

func set_damage_per_meter_upgrade_cost(value: float):
	_damagePerMeterUC = value
	attack_upgrade_values_updated.emit(_damagePerMeterUC)

func get_initial_damage_per_meter_upgrade_cost():
	return _initialDamagePerMeterUC

func update_initial_damage_per_meter_upgrade_cost(value: float):
	_initialDamagePerMeterUC += value
	attack_upgrade_values_updated.emit(_initialDamagePerMeterUC)

func set_initial_damage_per_meter_upgrade_cost(value: float):
	_initialDamagePerMeterUC = value
	attack_upgrade_values_updated.emit(_initialDamagePerMeterUC)












# defense

func get_health():
	return _health

func update_health(value: float):
	_health += value
	defense_upgrade_values_updated.emit(_health)
	if(_health <= 0.0):
		game_over.emit(_health)

func set_health(value: float):
	_health = value
	defense_upgrade_values_updated.emit(_health)
	if(_health <= 0.0):
		game_over.emit(_health)

func get_initial_health():
	return _initialHealth

func update_initial_health(value: float):
	_initialHealth += value
	defense_upgrade_values_updated.emit(_initialHealth)
	if(_initialHealth <= 0.0):
		game_over.emit(_initialHealth)

func set_initial_health(value: float):
	_initialHealth = value
	defense_upgrade_values_updated.emit(_initialHealth)
	if(_initialHealth <= 0.0):
		game_over.emit(_initialHealth)

func get_health_delta():
	return _healthDelta







func get_health_regeneration():
	return _healthRegeneration

func update_health_regeneration(value: float):
	_healthRegeneration += value
	defense_upgrade_values_updated.emit(_healthRegeneration)
	health_regeneration_value_updated.emit(_healthRegeneration)

func set_health_regeneration(value: float):
	_healthRegeneration = value
	defense_upgrade_values_updated.emit(_healthRegeneration)
	health_regeneration_value_updated.emit(_healthRegeneration)

func get_initial_health_regeneration():
	return _initialHealthRegeneration

func update_initial_health_regeneration(value: float):
	_initialHealthRegeneration += value
	defense_upgrade_values_updated.emit(_initialHealthRegeneration)
	health_regeneration_value_updated.emit(_initialHealthRegeneration)

func set_initial_health_regeneration(value: float):
	_initialHealthRegeneration = value
	defense_upgrade_values_updated.emit(_initialHealthRegeneration)
	health_regeneration_value_updated.emit(_initialHealthRegeneration)

func get_health_regeneration_delta():
	return _healthRegenerationDelta





func get_defense_percentage():
	return _defensePercentage

func update_defense_percentage(value: float):
	_defensePercentage += value
	defense_upgrade_values_updated.emit(_defensePercentage)

func set_defense_percentage(value: float):
	_defensePercentage = value
	defense_upgrade_values_updated.emit(_defensePercentage)

func get_initial_defense_percentage():
	return _initialDefensePercentage

func update_initial_defense_percentage(value: float):
	_initialDefensePercentage += value
	defense_upgrade_values_updated.emit(_initialDefensePercentage)

func set_initial_defense_percentage(value: float):
	_initialDefensePercentage = value
	defense_upgrade_values_updated.emit(_initialDefensePercentage)

func get_defense_percentage_delta():
	return _defensePercentageDelta





func get_defense_absolute():
	return _defenseAbsolute

func update_defense_absolute(value: float):
	_defenseAbsolute += value
	defense_upgrade_values_updated.emit(_defenseAbsolute)

func set_defense_absolute(value: float):
	_defenseAbsolute = value
	defense_upgrade_values_updated.emit(_defenseAbsolute)

func get_initial_defense_absolute():
	return _initialDefenseAbsolute

func update_initial_defense_absolute(value: float):
	_initialDefenseAbsolute += value
	defense_upgrade_values_updated.emit(_initialDefenseAbsolute)

func set_initial_defense_absolute(value: float):
	_initialDefenseAbsolute = value
	defense_upgrade_values_updated.emit(_initialDefenseAbsolute)

func get_defense_absolute_delta():
	return _defenseAbsoluteDelta








# defense upgrade cost

func get_health_upgrade_cost():
	return _healthUC

func update_health_upgrade_cost(value: float):
	_healthUC += value
	defense_upgrade_values_updated.emit(_healthUC)

func set_health_upgrade_cost(value: float):
	_healthUC = value
	defense_upgrade_values_updated.emit(_healthUC)

func get_initial_health_upgrade_cost():
	return _initialHealthUC

func update_initial_health_upgrade_cost(value: float):
	_initialHealthUC += value
	defense_upgrade_values_updated.emit(_initialHealthUC)

func set_initial_health_upgrade_cost(value: float):
	_initialHealthUC = value
	defense_upgrade_values_updated.emit(_initialHealthUC)






func get_health_regeneration_upgrade_cost():
	return _healthRegenerationUC

func update_health_regeneration_upgrade_cost(value: float):
	_healthRegenerationUC += value
	defense_upgrade_values_updated.emit(_healthRegenerationUC)

func set_health_regeneration_upgrade_cost(value: float):
	_healthRegenerationUC = value
	defense_upgrade_values_updated.emit(_healthRegenerationUC)

func get_initial_health_regeneration_upgrade_cost():
	return _initialHealthRegenerationUC

func update_initial_health_regeneration_upgrade_cost(value: float):
	_initialHealthRegenerationUC += value
	defense_upgrade_values_updated.emit(_initialHealthRegenerationUC)

func set_initial_health_regeneration_upgrade_cost(value: float):
	_initialHealthRegenerationUC = value
	defense_upgrade_values_updated.emit(_initialHealthRegenerationUC)
	





func get_defense_percentage_upgrade_cost():
	return _defensePercentageUC

func update_defense_percentage_upgrade_cost(value: float):
	_defensePercentageUC += value
	defense_upgrade_values_updated.emit(_defensePercentageUC)

func set_defense_percentage_upgrade_cost(value: float):
	_defensePercentageUC = value
	defense_upgrade_values_updated.emit(_defensePercentageUC)

func get_initial_defense_percentage_upgrade_cost():
	return _initialDefensePercentageUC

func update_initial_defense_percentage_upgrade_cost(value: float):
	_initialDefensePercentageUC += value
	defense_upgrade_values_updated.emit(_initialDefensePercentageUC)

func set_initial_defense_percentage_upgrade_cost(value: float):
	_initialDefensePercentageUC = value
	defense_upgrade_values_updated.emit(_initialDefensePercentageUC)











func get_defense_absolute_upgrade_cost():
	return _defenseAbsoluteUC

func update_defense_absolute_upgrade_cost(value: float):
	_defenseAbsoluteUC += value
	defense_upgrade_values_updated.emit(_defenseAbsoluteUC)

func set_defense_absolute_upgrade_cost(value: float):
	_defenseAbsoluteUC = value
	defense_upgrade_values_updated.emit(_defenseAbsoluteUC)

func get_initial_defense_absolute_upgrade_cost():
	return _initialDefenseAbsoluteUC

func update_initial_defense_absolute_upgrade_cost(value: float):
	_initialDefenseAbsoluteUC += value
	defense_upgrade_values_updated.emit(_initialDefenseAbsoluteUC)

func set_initial_defense_absolute_upgrade_cost(value: float):
	_initialDefenseAbsoluteUC = value
	defense_upgrade_values_updated.emit(_initialDefenseAbsoluteUC)













# utility

func get_cash_bonus():
	return _cashBonus
	
func update_cash_bonus(value: float):
	_cashBonus += value
	utility_upgrade_values_updated.emit(_cashBonus)

func set_cash_bonus(value: float):
	_cashBonus = value
	utility_upgrade_values_updated.emit(_cashBonus)	

func get_initial_cash_bonus():
	return _initialCashBonus
	
func update_initial_cash_bonus(value: float):
	_initialCashBonus += value
	utility_upgrade_values_updated.emit(_initialCashBonus)

func set_initial_cash_bonus(value: float):
	_initialCashBonus = value
	utility_upgrade_values_updated.emit(_initialCashBonus)	

func get_cash_bonus_delta():
	return _cashBonusDelta








func get_cash_per_wave():
	return _cashPerWave

func update_cash_per_wave(value: float):
	_cashPerWave += value
	utility_upgrade_values_updated.emit(_cashPerWave)

func set_cash_per_wave(value: float):
	_cashPerWave = value
	utility_upgrade_values_updated.emit(_cashPerWave)

func get_initial_cash_per_wave():
	return _initialCashPerWave

func update_initial_cash_per_wave(value: float):
	_initialCashPerWave += value
	utility_upgrade_values_updated.emit(_initialCashPerWave)

func set_initial_cash_per_wave(value: float):
	_initialCashPerWave = value
	utility_upgrade_values_updated.emit(_initialCashPerWave)

func get_cash_per_wave_delta():
	return _cashPerWaveDelta








func get_coins_per_kill_bonus():
	return _coinsPerKillBonus

func update_coins_per_kill_bonus(value: float):
	_coinsPerKillBonus += value
	utility_upgrade_values_updated.emit(_coinsPerKillBonus)

func set_coins_per_kill_bonus(value: float):
	_coinsPerKillBonus = value
	utility_upgrade_values_updated.emit(_coinsPerKillBonus)


func get_initial_coins_per_kill_bonus():
	return _initialCoinsPerKillBonus

func update_initial_coins_per_kill_bonus(value: float):
	_initialCoinsPerKillBonus += value
	utility_upgrade_values_updated.emit(_initialCoinsPerKillBonus)

func set_initial_coins_per_kill_bonus(value: float):
	_initialCoinsPerKillBonus = value
	utility_upgrade_values_updated.emit(_initialCoinsPerKillBonus)

func get_coins_per_kill_bonus_delta():
	return _coinsPerKillBonusDelta





func get_coins_per_wave():
	return _coinsPerWave
	
func update_coins_per_wave(value: float):
	_coinsPerWave += value
	utility_upgrade_values_updated.emit(_coinsPerWave)

func set_coins_per_wave(value: float):
	_coinsPerWave = value
	utility_upgrade_values_updated.emit(_coinsPerWave)

func get_initial_coins_per_wave():
	return _initialCoinsPerWave
	
func update_initial_coins_per_wave(value: float):
	_initialCoinsPerWave += value
	utility_upgrade_values_updated.emit(_initialCoinsPerWave)

func set_initial_coins_per_wave(value: float):
	_initialCoinsPerWave = value
	utility_upgrade_values_updated.emit(_initialCoinsPerWave)

func get_coins_per_wave_delta():
	return _coinsPerWaveDelta












# utility upgrade cost
	
func get_cash_bonus_upgrade_cost():
	return _cashBonusUC
	
func update_cash_bonus_upgrade_cost(value: float):
	_cashBonusUC += value
	utility_upgrade_values_updated.emit(_cashBonusUC)

func set_cash_bonus_upgrade_cost(value: float):
	_cashBonusUC = value
	utility_upgrade_values_updated.emit(_cashBonusUC)	

func get_initial_cash_bonus_upgrade_cost():
	return _initialCashBonusUC
	
func update_initial_cash_bonus_upgrade_cost(value: float):
	_initialCashBonusUC += value
	utility_upgrade_values_updated.emit(_initialCashBonusUC)

func set_initial_cash_bonus_upgrade_cost(value: float):
	_initialCashBonusUC = value
	utility_upgrade_values_updated.emit(_initialCashBonusUC)	






func get_cash_per_wave_upgrade_cost():
	return _cashPerWaveUC

func update_cash_per_wave_upgrade_cost(value: float):
	_cashPerWaveUC += value
	utility_upgrade_values_updated.emit(_cashPerWaveUC)

func set_cash_per_wave_upgrade_cost(value: float):
	_cashPerWaveUC = value
	utility_upgrade_values_updated.emit(_cashPerWaveUC)

func get_initial_cash_per_wave_upgrade_cost():
	return _initialCashPerWaveUC

func update_initial_cash_per_wave_upgrade_cost(value: float):
	_initialCashPerWaveUC += value
	utility_upgrade_values_updated.emit(_initialCashPerWaveUC)

func set_initial_cash_per_wave_upgrade_cost(value: float):
	_initialCashPerWaveUC = value
	utility_upgrade_values_updated.emit(_initialCashPerWaveUC)




func get_coins_per_kill_bonus_upgrade_cost():
	return _coinsPerKillBonusUC

func update_coins_per_kill_bonus_upgrade_cost(value: float):
	_coinsPerKillBonusUC += value
	utility_upgrade_values_updated.emit(_coinsPerKillBonusUC)

func set_coins_per_kill_bonus_upgrade_cost(value: float):
	_coinsPerKillBonusUC = value
	utility_upgrade_values_updated.emit(_coinsPerKillBonusUC)

func get_initial_coins_per_kill_bonus_upgrade_cost():
	return _initialCoinsPerKillBonusUC

func update_initial_coins_per_kill_bonus_upgrade_cost(value: float):
	_initialCoinsPerKillBonusUC += value
	utility_upgrade_values_updated.emit(_initialCoinsPerKillBonusUC)

func set_initial_coins_per_kill_bonus_upgrade_cost(value: float):
	_initialCoinsPerKillBonusUC = value
	utility_upgrade_values_updated.emit(_initialCoinsPerKillBonusUC)





func get_coins_per_wave_upgrade_cost():
	return _coinsPerWaveUC

func update_coins_per_wave_upgrade_cost(value: float):
	_coinsPerWaveUC += value
	utility_upgrade_values_updated.emit(_coinsPerWaveUC)

func set_coins_per_wave_upgrade_cost(value: float):
	_coinsPerWaveUC = value
	utility_upgrade_values_updated.emit(_coinsPerWaveUC)

func get_initial_coins_per_wave_upgrade_cost():
	return _initialCoinsPerWaveUC

func update_initial_coins_per_wave_upgrade_cost(value: float):
	_initialCoinsPerWaveUC += value
	utility_upgrade_values_updated.emit(_initialCoinsPerWaveUC)

func set_initial_coins_per_wave_upgrade_cost(value: float):
	_initialCoinsPerWaveUC = value
	utility_upgrade_values_updated.emit(_initialCoinsPerWaveUC)
