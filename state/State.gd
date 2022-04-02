extends Node


export(int) var month := 0 setget set_month
export(int) var year := 2022 setget set_year

export(int) var temperature_c := 18 setget set_temperature_c

export(int) var money := 1000 setget set_money

export(String) var news := "" setget set_news


signal date_changed(month, year)
signal temperature_changed(temperature_c)
signal money_changed(money)
signal news_changed(news)


func increment_month() -> void:
	month = month + 1
	if month >= 12:
		month = 0
		year += 1
	emit_signal("date_changed", month, year)


func set_month(value: int) -> void:
	month = value
	emit_signal("date_changed", month, year)


func set_year(value: int) -> void:
	year = value
	emit_signal("date_changed", month, year)


func set_temperature_c(value: int) -> void:
	temperature_c = value
	emit_signal("temperature_changed", temperature_c)


func set_money(value: int) -> void:
	money = value
	emit_signal("money_changed", money)


func set_news(value: String) -> void:
	news = value
	emit_signal("news_changed", news)
