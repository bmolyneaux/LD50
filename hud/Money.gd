extends Label


func _comma_sep(number: int) -> String:
	var string = str(number)
	var mod = string.length() % 3
	var res = ""

	for i in range(0, string.length()):
		if i != 0 && i % 3 == mod:
			res += ","
		res += string[i]

	return res


func _on_money_changed(money) -> void:
	text = "$" + _comma_sep(money)


func _ready() -> void:
	State.connect("money_changed", self, "_on_money_changed")
