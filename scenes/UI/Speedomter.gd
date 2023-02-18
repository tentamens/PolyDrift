extends Sprite

onready var tween:= create_tween()


func _process(delta: float) -> void:
	tween = create_tween()
	tween.tween_property($kneedle, "rotation_degrees", ((Globals.speed - 110) + Globals.speed / 1.5 ) , 0.2)
	
	$Label.text = str(Globals.Gear)
	
