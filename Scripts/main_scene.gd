extends Node2D

@onready var item = preload("res://Nodes/Scenes/Pickup_Item.tscn")
@onready var _items_name = StaticData.food_items.keys()


func _ready():
	var items_size = _items_name.size()
	for i in range(300):
		randomize()
		var new_item = item.instantiate()
		$PickupItems.add_child(new_item)
		new_item.set_item(StaticData.food_items, _items_name[randi() % items_size], randi_range(1,20))
		new_item.position = Vector2i(randi_range(-20, 47)*32, randi_range(-16, 32)*32)
  
