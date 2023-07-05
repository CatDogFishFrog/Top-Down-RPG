extends TextureRect

var item: Dictionary = {}
var amount: int = 0

func set_item(items_dict: Dictionary, item_id: String, item_amount: int) -> void:
	name = item_id
	item = items_dict[item_id]
	item["id"] = item_id
	texture = AtlasTexture.new()
	texture.atlas = load(item["texture_atlas_file_location"])
	update_item_amount(item_amount)

func update_item_amount(item_amount: int):
	amount = item_amount
	$Amount.text = str(amount)
	match amount:
		0: queue_free()
		1, 2, 3: _set_texture()
		4, 5, 6, 7, 8: _set_texture(32)
		_: _set_texture(64)

func _set_texture(y_offset: int = 0):
	texture.region = Rect2(
			item["texture_coordinates"][0] * item["texture_grid_size"][0],
			(item["texture_coordinates"][1] * item["texture_grid_size"][1] * 5) + y_offset,
			item["texture_grid_size"][0],
			item["texture_grid_size"][1]
			)