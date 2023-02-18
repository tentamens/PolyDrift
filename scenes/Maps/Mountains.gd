extends Spatial



func _unhandled_key_input(event: InputEventKey) -> void:
	if event.is_action_pressed('restart'):
		get_tree().reload_current_scene()
	if event.is_action_pressed('close'):
		get_tree().quit()

func carHitWall(body: Node) -> void:
	pass # Replace with function body.
