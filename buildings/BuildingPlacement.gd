extends Spatial

export(NodePath) var camera
onready var _camera := get_node(camera) as Camera

var _dragging = false
var _moved = false


func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			_dragging = true
			_moved = false
		else:
			_dragging = false
			
			if not _moved:
				var from = _camera.project_ray_origin(event.position)
				var to = from + _camera.project_ray_normal(event.position) * 100
				var intersection = get_world().direct_space_state.intersect_ray(from, to)
				if not intersection.empty():
					print(intersection.position)
					var building = preload("res://buildings/Building.tscn").instance()
					var up = Vector3(0, 1, 0)
					#var right = Vector3(1, 0, 0)
					var a = up.cross(intersection.normal).normalized()
					var b = a.cross(intersection.normal).normalized()
					var basis = Basis(a, intersection.normal, b)
					var transform = Transform(basis, intersection.position)
					building.transform = transform
					get_parent().add_child(building)
	elif event is InputEventMouseMotion and _dragging:
		var camera_root = _camera.get_parent() as Spatial
		_camera.transform = _camera.transform.rotated(Vector3(0, 1, 0), -event.relative.x * 0.004)
