extends NinePatchRect

@onready var item = preload("res://Nodes/Scenes/inventory_item.tscn")
@onready var grid = $Scroll/Grid

func clear():
    for item_object in grid.get_children():
        grid.remove_child(item_object)
        item_object.queue_free()

func _ready():
    clear()

func show_inventory(inventory: Dictionary):
    for item_key in inventory.keys():
        var new_item = item.instantiate()
        grid.add_child(new_item)
        new_item.set_item(StaticData.food_items, item_key, inventory[item_key])