extends Control

onready var checkPointTimeGreen = $checkPointTimeLabelGreen
onready var checkPointTimeRed = $checkPointTimeLabelRed

# Drifting game mode

onready var driftTimer = get_node('driftCloseCallTimer')
onready var driftScoreLable = get_node('Score/driftScore')
onready var multiplyerLabel = get_node('Score/multiplyer')
onready var driftScoreLabelTween = get_node('Score/driftScoreTween')


var tween

var drift_score = 0
var trueDriftScore = 0 
var drifting = false
var driftable = true



var multiplyer = 1


func _process(delta: float) -> void:
	get_node('FPS').text = str(Engine.get_frames_per_second())


func checkPointUpdate(difference):
	$checkPointTImeTimer.start()
	
	if difference < 0:
		checkPointTimeGreen.text = "+" + str(difference)
		return
	
	checkPointTimeRed.text = "-" + str(difference)
	

func _on_checkPointTImeTimer_timeout() -> void:
	checkPointTimeGreen.text = ""
	checkPointTimeRed.text = ""
	


func drift_data(velocity):
	
	
	var driftDirection = abs(velocity.x)
	
	if driftable == false:
		drift_score = 0
		return
	
	if driftDirection > 6 :
		drifting = true
		drift_score = round(drift_score + (driftDirection / 2))
		driftScoreLable.text = str(drift_score)
		return
	
	if drift_score == 0:
		return
	
	
	if get_node('driftCancleTimer').is_stopped():
		get_node('driftCancleTimer').start()
	
	
	drifting = false









func _on_Closecall_body_entered(body: Node) -> void:
	if drifting == true and driftTimer.is_stopped():
		driftTimer.start()


func closeCallTimer() -> void:
	if driftable and drifting:
		multiplyer += 0.1
		multiplyerLabel.text = "x" + str(multiplyer)

func _on_Closecall_body_exited(body: Node) -> void:
	driftTimer.stop()


func carHitWall(body: Node) -> void:
	
	multiplyer = 1
	multiplyerLabel.text = ""
	
	driftable = false
	
	get_node('driftCoolDown').start()
	
	tween = create_tween()
	
	driftScoreLabelTween.text = str(drift_score)
	driftScoreLable.text = ""
	
	driftScoreLabelTween.rect_position =  Vector2(-65.01, 28.133)
	driftScoreLabelTween.modulate.a = 1
	
	
	tween.tween_property(driftScoreLabelTween, 'modulate:a', 0.0, 1)
	tween = create_tween()
	tween.tween_property(driftScoreLabelTween, 'rect_position', Vector2(-65.01, 99), 1)
	
	
	drift_score = 0
	driftScoreLable.text = ""


func driftCancleTimer() -> void:
	if drifting == false:
		trueDriftScore += drift_score * multiplyer
		multiplyer = 1
		get_node('Score/driftScoreT').text = str(trueDriftScore)
		drift_score = 0
		driftScoreLable.text = ""
		multiplyerLabel.text = ""


func driftCoolDown() -> void:
	driftable = true
