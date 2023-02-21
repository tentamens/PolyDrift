extends Node


func writeData(fileName, data):
	print("writing data")
	var save_data = File.new()
	save_data.open("user://" + fileName + ".text", File.WRITE)
	
	save_data.store_line(to_json(data))
	
	save_data.close()


	
func loadData(fileName):
	var data
	var load_data = File.new()
	if not load_data.file_exists("user://" + fileName + ".text"):
		print("not there")
		return
	
	load_data.open("user://" + fileName + ".text", File.READ)
	
	while load_data.get_position() < load_data.get_len():
		var nodeData = parse_json(load_data.get_line())
		
		data = nodeData
	
	return data
	
