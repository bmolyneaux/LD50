extends Label


var MONTHS = [
	"JAN",
	"FEB",
	"MAR",
	"APR",
	"MAY",
	"JUN",
	"JUL",
	"AUG",
	"SEP",
	"OCT",
	"NOV",
	"DEC"
]


func _on_date_changed(month: int, year: int) -> void:
	text = MONTHS[month] + " " + String(year)


func _ready() -> void:
	State.connect("date_changed", self, "_on_date_changed")
