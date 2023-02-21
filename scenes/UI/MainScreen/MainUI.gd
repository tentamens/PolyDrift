extends Control

onready var Mountains = preload('res://scenes/Maps/Mountains.tscn')
onready var gameMode = preload('res://scenes/UI/UIscenes/gameMode/gameMode.tscn')

onready var clickSoundTrack = $HBoxContainer/click





func _on_QuickRace_pressed() -> void:
	clickSoundTrack.play()
	var newInstance =  Mountains.instance()
	Globals.gameMode = "bestTime"
	get_tree().change_scene_to(Mountains)


func _on_QuickRace_focus_entered() -> void:
	pass # Replace with function body.


func _on_QuickRace_focus_exited() -> void:
	pass # Replace with function body.


func _on_GameModes_pressed() -> void:
	get_tree().change_scene_to(gameMode)
