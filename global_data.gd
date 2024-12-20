extends Node


# RESOURCES

const _INITIAL_CASH_VALUE  = 100.0 # during wave 1 start

var _cashValue = _INITIAL_CASH_VALUE
var _coinValue = 0.0
var _gemValue = 0.0

# WAVE 
const _INITIAL_WAVE_NUMBER = 1.0
const _INITIAL_HIGHEST_WAVE = 0.0
const _BASE_ENEMY_SPAWN_PER_WAVE = 10.0

var _waveNumber = _INITIAL_WAVE_NUMBER
var _highestWave = _INITIAL_HIGHEST_WAVE
var _waveEnemiesSpawned = 0.0
var _waveEnemiesKilled = 0.0
var _totalEnemySpawnsPerWave = _BASE_ENEMY_SPAWN_PER_WAVE


# enemy data
# INITIAL ENEMY DATA
var _INITIAL_ENEMY_SPAWNINTERVAL = 1
var _INITIAL_ENEMY_HEALTH = 1.0
var _INITIAL_ENEMY_DAMAGE = 1.0
var _INITIAL_ENEMY_CASHVALUE = 1.0
var _INITIAL_ENEMY_COINVALUE = 0.1

var _enemySpawnInterval = 1
var _enemyHealth = 1.0
var _enemyDamage = 1.0
var _enemyCashValue = 1.0
var _enemyCoinValue = 0.1

# shooter data
# attack
var _INITIAL_DAMAGE = 1.00
var _INITIAL_ATTACK_SPEED = 1.00
var _INITIAL_CRITICAL_CHANCE = 1.00
var _INITIAL_CRITICAL_FACTOR = 1.00
var _INITIAL_RANGE = 225.00
var _INITIAL_DAMAGE_PER_METER = 1.00

var _damage = 1.00
var _attackSpeed = 1.00
var _criticalChance = 1.00
var _criticalFactor = 1.00
var _range = 225.00
var _damagePerMeter = 1.00

var _INITIAL_DAMAGE_UPGRADE_COST = 10.00
var _INITIAL_ATTACK_SPEED_UPGRADE_COST = 10.00
var _INITIAL_CRITICAL_CHANCE_UPGRADE_COST = 10.00
var _INITIAL_CRITICAL_FACTOR_UPGRADE_COST = 10.00
var _INITIAL_RANGE_UPGRADE_COST = 10.00
var _INITIAL_DAMAGE_PER_METER_UPGRADE_COST = 10.00

var _damageUpgradeCost = 10.00
var _attackSpeedUpgradeCost = 10.00
var _criticalChanceUpgradeCost = 10.00
var _criticalFactorUpgradeCost = 10.00
var _rangeUpgradeCost = 10.00
var _damagePerMeterUpgradeCost = 10.00

# defense

var _INITIAL_HEALTH = 10.00
var _INITIAL_HEALTH_REGENERATION = 0.00
var _INITIAL_DEFENSE_PERCENTAGE = 0.00
var _INITIAL_DEFENSE_ABSOLUTE = 0.00

var _health = 10.00
var _healthRegeneration = 0.00
var _defensePercentage = 0.00
var _defenseAbsolute = 0.00

var _INITIAL_HEALTH_UPGRADE_COST = 10.00
var _INITIAL_HEALTH_REGENERATION_UPGRADE_COST = 10.00
var _INITIAL_DEFENSE_PERCENTAGE_UPGRADE_COST = 10.00
var _INITIAL_DEFENSE_ABSOLUTE_UPGRADE_COST = 10.00

var _healthUpgradeCost = 10.00
var _healthRegenerationUpgradeCost = 10.00
var _defensePercentageUpgradeCost = 10.00
var _defenseAbsoluteUpgradeCost = 10.00

# utility
var _INITIAL_CASH_BONUS = 1.00
var _INITIAL_CASH_PER_WAVE = 10.00
var _INITIAL_COINS_PER_KILL_BONUS = 1.00
var _INITIAL_COINS_PER_WAVE = 1.0

var _cashBonus = 1.00
var _cashPerWave = 10.00
var _coinsPerKillBonus = 1.00
var _coinsPerWave = 1.0

var _INITIAL_CASH_BONUS_UPGRADE_COST = 10.00
var _INITIAL_CASH_PER_WAVE_UPGRADE_COST = 10.00
var _INITIAL_COINS_PER_KILL_BONUS_UPGRADE_COST = 10.00
var _INITIAL_COINS_PER_WAVE_UPGRADE_COST = 10.0

var _cashBonusUpgradeCost = 10.00
var _cashPerWaveUpgradeCost = 10.00
var _coinsPerKillBonusUpgradeCost = 10.00
var _coinsPerWaveUpgradeCost = 10.0

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
	_cashValue = _INITIAL_CASH_VALUE
	
	# wave
	_waveNumber = 1
	_waveEnemiesSpawned = 0
	_waveEnemiesKilled = 0
	
	# enemy data
	_enemySpawnInterval = _INITIAL_ENEMY_SPAWNINTERVAL
	_enemyHealth = _INITIAL_ENEMY_HEALTH
	_enemyDamage = _INITIAL_ENEMY_DAMAGE
	_enemyCashValue = _INITIAL_ENEMY_CASHVALUE
	_enemyCoinValue = _INITIAL_ENEMY_COINVALUE
	
	# shooter data
	# attack
	_damage = _INITIAL_DAMAGE
	_attackSpeed = _INITIAL_ATTACK_SPEED
	_criticalChance = _INITIAL_CRITICAL_CHANCE
	_criticalFactor = _INITIAL_CRITICAL_FACTOR
	_range = _INITIAL_RANGE
	_damagePerMeter= _INITIAL_DAMAGE_PER_METER 

	_damageUpgradeCost = _INITIAL_DAMAGE_UPGRADE_COST
	_attackSpeedUpgradeCost = _INITIAL_ATTACK_SPEED_UPGRADE_COST
	_criticalChanceUpgradeCost = _INITIAL_CRITICAL_CHANCE_UPGRADE_COST
	_criticalFactorUpgradeCost = _INITIAL_CRITICAL_FACTOR_UPGRADE_COST
	_rangeUpgradeCost = _INITIAL_RANGE_UPGRADE_COST
	_damagePerMeterUpgradeCost= _INITIAL_DAMAGE_PER_METER_UPGRADE_COST

	# defense
	_health = _INITIAL_HEALTH
	_healthRegeneration = _INITIAL_HEALTH_REGENERATION
	_defensePercentage = _INITIAL_DEFENSE_PERCENTAGE
	_defenseAbsolute= _INITIAL_DEFENSE_ABSOLUTE

	_healthUpgradeCost = _INITIAL_HEALTH_UPGRADE_COST
	_healthRegenerationUpgradeCost = _INITIAL_HEALTH_REGENERATION_UPGRADE_COST
	_defensePercentageUpgradeCost = _INITIAL_DAMAGE_PER_METER_UPGRADE_COST
	_defenseAbsoluteUpgradeCost= _INITIAL_DEFENSE_ABSOLUTE_UPGRADE_COST

	# utility
	_cashBonus = _INITIAL_CASH_BONUS
	_cashPerWave = _INITIAL_CASH_PER_WAVE
	_coinsPerKillBonus = _INITIAL_COINS_PER_KILL_BONUS
	_coinsPerWave= _INITIAL_COINS_PER_WAVE

	_cashBonusUpgradeCost = _INITIAL_CASH_BONUS_UPGRADE_COST
	_cashPerWaveUpgradeCost = _INITIAL_CASH_PER_WAVE_UPGRADE_COST
	_coinsPerKillBonusUpgradeCost = _INITIAL_COINS_PER_KILL_BONUS_UPGRADE_COST
	_coinsPerWaveUpgradeCost= _INITIAL_COINS_PER_WAVE_UPGRADE_COST

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
	
func update_wave_number(value: int):
	_waveNumber += value
	_highestWave = max(_highestWave, _waveNumber)
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

func get_enemy_health():
	return _enemyHealth * _waveNumber

func update_enemy_health(value: float):
	_enemyHealth += value
	
func get_enemy_spawn_interval():
	return _enemySpawnInterval
	
func update_enemy_spawn_interval(value: float):
	_enemySpawnInterval += value
	
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
	
func get_attack_speed():
	return _attackSpeed
	
func update_attack_speed(value: float):
	_attackSpeed += value
	attack_upgrade_values_updated.emit(_attackSpeed)	

func get_critical_chance():
	return _criticalChance

func update_critical_chance(value: float):
	_criticalChance += value
	attack_upgrade_values_updated.emit(_criticalChance)

func get_critical_factor():
	return _criticalFactor

func update_critical_factor(value: float):
	_criticalFactor += value
	attack_upgrade_values_updated.emit(_criticalFactor)

func get_range():
	return _range

func update_range(value: float):
	_range += value
	attack_upgrade_values_updated.emit(_range)

func get_damage_per_meter():
	return _damagePerMeter
	
func update_damage_per_meter(value: float):
	_damagePerMeter += value
	attack_upgrade_values_updated.emit(_damagePerMeter)













# attack upgrade cost

func get_damage_upgrade_cost():
	return _damageUpgradeCost
	
func update_damage_upgrade_cost(value: float):
	_damageUpgradeCost += value
	attack_upgrade_values_updated.emit(_damageUpgradeCost)

	
func get_attack_speed_upgrade_cost():
	return _attackSpeedUpgradeCost

func update_attack_speed_upgrade_cost(value: float):
	_attackSpeedUpgradeCost += value
	attack_upgrade_values_updated.emit(_attackSpeedUpgradeCost)

func get_critical_chance_upgrade_cost():
	return _criticalChanceUpgradeCost

func update_critical_chance_upgrade_cost(value: float):
	_criticalChanceUpgradeCost += value
	attack_upgrade_values_updated.emit(_criticalChanceUpgradeCost)

func get_critical_factor_upgrade_cost():
	return _criticalFactorUpgradeCost

func update_critical_factor_upgrade_cost(value: float):
	_criticalFactorUpgradeCost += value
	attack_upgrade_values_updated.emit(_criticalFactorUpgradeCost)

func get_range_upgrade_cost():
	return _rangeUpgradeCost

func update_range_upgrade_cost(value: float):
	_rangeUpgradeCost += value
	attack_upgrade_values_updated.emit(_rangeUpgradeCost)
	
func get_damage_per_meter_upgrade_cost():
	return _damagePerMeterUpgradeCost

func update_damage_per_meter_upgrade_cost(value: float):
	_damagePerMeterUpgradeCost += value
	attack_upgrade_values_updated.emit(_damagePerMeterUpgradeCost)













# defense

func get_health():
	return _health

func update_health(value: float):
	_health += value
	defense_upgrade_values_updated.emit(_health)
	if(_health <= 0.0):
		game_over.emit(_health)
	
func get_health_regeneration():
	return _healthRegeneration

func update_health_regeneration(value: float):
	_healthRegeneration += value
	defense_upgrade_values_updated.emit(_healthRegeneration)
	health_regeneration_value_updated.emit(_healthRegeneration)

func get_defense_percentage():
	return _defensePercentage

func update_defense_percentage(value: float):
	_defensePercentage += value
	defense_upgrade_values_updated.emit(_defensePercentage)

func get_defense_absolute():
	return _defenseAbsolute

func update_defense_absolute(value: float):
	_defenseAbsolute += value
	defense_upgrade_values_updated.emit(_defenseAbsolute)












# defense upgrade cost

func get_health_upgrade_cost():
	return _healthUpgradeCost

func update_health_upgrade_cost(value: float):
	_healthUpgradeCost += value
	defense_upgrade_values_updated.emit(_healthUpgradeCost)

func get_health_regeneration_upgrade_cost():
	return _healthRegenerationUpgradeCost

func update_health_regeneration_upgrade_cost(value: float):
	_healthRegenerationUpgradeCost += value
	defense_upgrade_values_updated.emit(_healthRegenerationUpgradeCost)

func get_defense_percentage_upgrade_cost():
	return _defensePercentageUpgradeCost

func update_defense_percentage_upgrade_cost(value: float):
	_defensePercentageUpgradeCost += value
	defense_upgrade_values_updated.emit(_defensePercentageUpgradeCost)

func get_defense_absolute_upgrade_cost():
	return _defenseAbsoluteUpgradeCost

func update_defense_absolute_upgrade_cost(value: float):
	_defenseAbsoluteUpgradeCost += value
	defense_upgrade_values_updated.emit(_defenseAbsoluteUpgradeCost)














# utility

func get_cash_bonus():
	return _cashBonus
	
func update_cash_bonus(value: float):
	_cashBonus += value
	utility_upgrade_values_updated.emit(_cashBonus)
	
func get_cash_per_wave():
	return _cashPerWave

func update_cash_per_wave(value: float):
	_cashPerWave += value
	utility_upgrade_values_updated.emit(_cashPerWave)

func get_coins_per_kill_bonus():
	return _coinsPerKillBonus

func update_coins_per_kill_bonus(value: float):
	_coinsPerKillBonus += value
	utility_upgrade_values_updated.emit(_coinsPerKillBonus)

func get_coins_per_wave():
	return _coinsPerWave
	
func update_coins_per_wave(value: float):
	_coinsPerWave += value
	utility_upgrade_values_updated.emit(_coinsPerWave)















# utility upgrade cost
	
func get_cash_bonus_upgrade_cost():
	return _cashBonusUpgradeCost
	
func update_cash_bonus_upgrade_cost(value: float):
	_cashBonusUpgradeCost += value
	utility_upgrade_values_updated.emit(_cashBonusUpgradeCost)
	
func get_cash_per_wave_upgrade_cost():
	return _cashPerWaveUpgradeCost

func update_cash_per_wave_upgrade_cost(value: float):
	_cashPerWaveUpgradeCost += value
	utility_upgrade_values_updated.emit(_cashPerWaveUpgradeCost)

func get_coins_per_kill_bonus_upgrade_cost():
	return _coinsPerKillBonusUpgradeCost

func update_coins_per_kill_bonus_upgrade_cost(value: float):
	_coinsPerKillBonusUpgradeCost += value
	utility_upgrade_values_updated.emit(_coinsPerKillBonusUpgradeCost)

func get_coins_per_wave_upgrade_cost():
	return _coinsPerWaveUpgradeCost

func update_coins_per_wave_upgrade_cost(value: float):
	_coinsPerWaveUpgradeCost += value
	utility_upgrade_values_updated.emit(_coinsPerWaveUpgradeCost)
