extends Spatial

export(NodePath) var camera
onready var _camera := get_node(camera) as Camera

var _dragging = false
var _drag_delta := Vector2(0, 0)
var _drag_start_ms


func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			_dragging = true
			_drag_delta = Vector2(0, 0)
			_drag_start_ms = Time.get_ticks_msec()
		else:
			var drag_end_ms = Time.get_ticks_msec()
			var drag_delta_ms = drag_end_ms - _drag_start_ms
			_dragging = false
			
			if _drag_delta.length_squared() < 50 and drag_delta_ms < 500:
				var from = _camera.project_ray_origin(event.position)
				var to = from + _camera.project_ray_normal(event.position) * 100
				var intersection = get_world().direct_space_state.intersect_ray(from, to)
				if not intersection.empty() and intersection.collider.is_in_group("land"):
					print(intersection.position)
					var building = preload("res://buildings/Building.tscn").instance()
					var up = Vector3(0, 1, 0)
					var a = up.cross(intersection.normal).normalized()
					var b = a.cross(intersection.normal).normalized()
					var basis = Basis(a, intersection.normal, b)
					var transform = Transform(basis, intersection.position)
					building.transform = transform
					get_parent().add_child(building)
	elif event is InputEventMouseMotion and _dragging:
		_drag_delta += event.relative.abs()
		_camera.transform = _camera.transform.rotated(Vector3(0, 1, 0), -event.relative.x * 0.004)
