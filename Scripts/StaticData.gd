extends Node

var items_food_path = "res://Items/items_food.json"

@onready var food_items = load_json_file(items_food_path)

func load_json_file(file_Path: String):
	if FileAccess.file_exists(file_Path):
		var parsedResult = JSON.parse_string(FileAccess.open(file_Path, FileAccess.READ).get_as_text())
		if parsedResult is Dictionary:
			return parsedResult
		else:
			print("Error reading file")
	else:print("File doesn't exist!")

