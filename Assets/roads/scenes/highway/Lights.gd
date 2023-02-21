extends Spatial


func _ready() -> void:
	if Globals.dayTime == "Night":
		for i in self.get_child_count():
			get_child(i).light_energy = 1
