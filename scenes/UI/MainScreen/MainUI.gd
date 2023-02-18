extends Control

onready var Mountains = preload('res://scenes/Maps/Mountains.tscn')


onready var clickSoundTrack = $HBoxContainer/click





func _on_QuickRace_pressed() -> void:
	clickSoundTrack.play()
	var newInstance =  Mountains.instance()
	get_tree().change_scene_to(Mountains)


func _on_QuickRace_focus_entered() -> void:
	pass # Replace with function body.


func _on_QuickRace_focus_exited() -> void:
	pass # Replace with function body.
