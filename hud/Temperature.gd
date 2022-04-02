extends Label


func _on_temperature_changed(temperature_c) -> void:
	text = str(temperature_c) + "°C"


func _ready() -> void:
	State.connect("temperature_changed", self, "_on_temperature_changed")
