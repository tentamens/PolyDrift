extends Control

onready var Mountains = preload('res://scenes/Maps/Mountains.tscn')



func _on_driftScore_pressed() -> void:
	
	Globals.gameMode = "driftScore"
	get_tree().change_scene_to(Mountains)


func _on_bestLap_pressed() -> void:
	Globals.gameMode = "bestLap"
	get_tree().change_scene_to(Mountains)


func _on_Button_pressed() -> void:
	if Globals.dayTime == "Day":
		get_node('HBoxContainer/VBoxContainer2/Panel/VBoxContainer/Button').text = "Night"
		Globals.dayTime = "Night"
		return
	
	get_node('HBoxContainer/VBoxContainer2/Panel/VBoxContainer/Button').text = "Day"
	Globals.dayTime = "Day"
