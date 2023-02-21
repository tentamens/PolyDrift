extends Label

func _ready() -> void:
	if Globals.gameMode != "bestLap":
		self.set_physics_process(false)

func _process(delta: float) -> void:
	self.text = str(Globals.currentTime)
	get_parent().get_parent().get_node('HBoxContainer2/BestTimeTime').text = str(Globals.best_time)
