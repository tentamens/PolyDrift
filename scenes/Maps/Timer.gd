extends Area

var currentTime = 0

var go = false


func _physics_process(delta: float) -> void:
	if go == true:
		currentTime += stepify(delta, 0.01)
		Globals.currentTime = currentTime


func _on_Timer_area_entered(area: Area) -> void:
	go = true
	
	if Globals.gameMode == "DriftingScore":
		get_parent().get_node('Car/car/cameraPivot/Camera/CanvasLayer/UI')
	
	if currentTime < Globals.best_time or Globals.best_time == 0:
		Globals.best_time = currentTime
	currentTime = 0
	Globals.currentTime = 0
