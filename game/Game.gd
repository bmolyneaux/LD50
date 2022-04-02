extends Spatial


func _process(delta: float) -> void:
	State.increment_month()
	State.money += 1
	State.temperature_c += 1
	
