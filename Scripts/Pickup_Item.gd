extends Node2D
var items_list = {"Potato":[0, 0], "Carrot":[160, 0], "Onion":[480, 0], "Cabage":[864, 0]}
var pickup = true
var item = "No_Name_Item"

func set_item(item_name):
	var t = AtlasTexture.new()
	t.atlas = load("res://Textures/Objects/food.png")
	t.region = Rect2(items_list[item_name][0], items_list[item_name][1], 32, 32)
	$Sprite2D.texture = t
	item = item_name
	name = item_name
