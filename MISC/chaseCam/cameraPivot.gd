extends Spatial

var direction = Vector3.FORWARD


func _physics_process(delta: float) -> void:
	var current_velocity = get_parent().get_linear_velocity()
	current_velocity.y = 0
	direction = lerp(direction, -current_velocity.normalized(), 10  * delta)

	global_transform.basis = get_rotation_from_direction(direction)


func get_rotation_from_direction(look_direction: Vector3) -> Basis:
	look_direction = look_direction.normalized()
	var xAxis = look_direction.cross(Vector3.UP)
	return Basis(xAxis, Vector3.UP, -look_direction)
