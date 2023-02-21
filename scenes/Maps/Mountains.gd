extends Spatial





func _ready() -> void:
	if Globals.dayTime == "Night":
		get_node('sun').light_energy = 0
		$WorldEnvironment.environment.background_sky.sky_energy = 0.009
		$WorldEnvironment.environment.background_sky.sun_energy = 0


func _unhandled_key_input(event: InputEventKey) -> void:
	if event.is_action_pressed('restart'):
		get_tree().reload_current_scene()
	if event.is_action_pressed('close'):
		get_tree().quit()

func carHitWall(body: Node) -> void:
	pass # Replace with function body.
