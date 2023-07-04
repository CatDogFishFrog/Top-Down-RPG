extends Node2D

@onready var items_data = get_node(NodePath("/root/StaticData")).items_Data

var pickup = true
var item: Dictionary = {}
var amount = 1

func set_item(item_name, item_amount):
	name = item_name
	item = items_data[item_name]
	item["id"] = item_name
	$Sprite2D.texture = AtlasTexture.new()
	$Sprite2D.texture.atlas = load(item["texture_atlas_file_location"])
	$Sprite2D.texture.region = Rect2(
			item["texture_coordinates"][0],
			item["texture_coordinates"][1],
			item["texture_grid_size"][0],
			item["texture_grid_size"][1]
			)
			
	amount = item_amount 
	
	match amount:
		2: $Sprite2D.texture.region = Rect2(
					item["texture_coordinates"][0],
					item["texture_coordinates"][1]+32,
					item["texture_grid_size"][0],
					item["texture_grid_size"][1]
					)
		3: $Sprite2D.texture.region = Rect2(
					item["texture_coordinates"][0],
					item["texture_coordinates"][1]+64,
					item["texture_grid_size"][0],
					item["texture_grid_size"][1]
					)
