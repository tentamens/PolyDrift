extends Sprite


onready var tween:= create_tween()


func _process(delta: float) -> void:
	tween = create_tween()
	tween.tween_property($kneedle, "rotation_degrees", ((Globals.RPM / 100 - 110) + Globals.RPM / 100), 0.2)
