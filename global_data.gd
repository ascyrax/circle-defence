extends Node

const _INITIAL_DOLLAR_VALUE  = 80.0 # during wave 1 start
var _dollarValue = _INITIAL_DOLLAR_VALUE
var _coinValue = 0.0
var _gemValue = 0.0

signal dollar_value_updated
signal coin_value_updated
signal gem_value_updated

func update_dollar_value(value: float):
	_dollarValue += value
	dollar_value_updated.emit(_dollarValue) #Emit the signal

func update_coin_value(value: float):
	_coinValue += value
	coin_value_updated.emit(_coinValue) #Emit the signal

func update_gem_value(value: float):
	_gemValue += value
	gem_value_updated.emit(_gemValue) #Emit the signal

func get_dollar_value():
	return _dollarValue

func get_coin_value():
	return _coinValue
	
func get_gem_value():
	return _gemValue
