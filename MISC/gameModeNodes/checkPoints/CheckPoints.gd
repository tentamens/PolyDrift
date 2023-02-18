extends Spatial


var currentTime = 0

var lastTime = 0

var currentCheckPoint = null

var currentCheckPoints: Array


export (NodePath) var UIName

export(Array,String) var checkPointss

var check = checkPointss


func _ready():
	check = checkPointss.duplicate()
	lap_completed()
	
	if Globals.gameMode != "checkPoints":
		self.set_physics_process(false)



func _physics_process(delta: float) -> void:
	
	
	currentTime += stepify(delta, 0.1)
	
	
	if currentCheckPoints.empty():
		lap_completed()
		return
	
	
	if currentCheckPoint != null:
		print("hi")
		
		currentCheckPoint = null
	
	
	for path in currentCheckPoints:
		var node = get_parent().get_node("CheckPoints/" + str(path))
		
		# Check if the checkpoint was hit
		if !node.get_overlapping_areas():
			return
		
		get_node(str(node) + "/CSGTorus").visible = false
		
		currentCheckPoint = path
		
		currentCheckPoints.erase(path)
		
		
		
		# Checks if its the first time hitting the check point and adds it to global list
		if !Globals.lastCheckPoints.has("checkPoint" + str(path)):
			Globals.lastCheckPoints["checkPoint" + str(path)] = currentTime
			currentTime = 0
			return
		
		
		
		if currentTime < Globals.lastCheckPoints["checkPoint" + str(path)]:
			Globals.lastCheckPoints["checkPoint" + str(path)] = currentTime
		

		
		checkPointTime(currentTime-Globals.lastCheckPoints["checkPoint" + str(path)])
		
		currentTime = 0
		
		
		
		
		



func lap_completed():
	currentCheckPoints = check.duplicate()
	for path in currentCheckPoints:
		var node = get_parent().get_node("CheckPoints/" + str(path))
		get_node(str(node) + "/CSGTorus").visible = true


func checkPointTime(difference):
	get_node(UIName).checkPointUpdate(difference)

