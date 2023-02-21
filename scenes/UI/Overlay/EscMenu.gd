extends PopupPanel

onready var MainUI = load('res://scenes/UI/MainScreen/Main.tscn')

var master_bus = AudioServer.get_bus_index("Master")

var popped = false

func _ready() -> void:
	var value = Folders.loadData("volumeLevel")
	
	if value == null:
		return
	
	get_node('VBoxContainer/VBoxContainer/HBoxContainer/Panel/HSlider').value = value.level
	AudioServer.set_bus_volume_db(master_bus, value.level)

func _on_HSlider_value_changed(value: float) -> void:
	
	var data = {"level": value}
	
	Folders.writeData("volumeLevel", data)
	
	AudioServer.set_bus_volume_db(master_bus, value)


func _unhandled_input(event: InputEvent) -> void:
	
	
	if !event.is_action_pressed('ESC'):
		return
	
	if self.visible:
		visible = false
		return
	
	
	self.visible = true
	


func _on_Menu_pressed() -> void:
	get_tree().change_scene_to(MainUI)


func _on_Button2_pressed() -> void:
	get_tree().quit()
