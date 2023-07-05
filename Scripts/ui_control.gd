extends Control


func toggle_inventory(inventory):
	if $InventoryInterface.visible:
		$InventoryInterface.clear()
		$InventoryInterface.visible = false

	else:
		$InventoryInterface.visible = true
		$InventoryInterface.show_inventory(inventory)

func update_inventory(inventory):
	if $InventoryInterface.visible:
		$InventoryInterface.clear()
		$InventoryInterface.show_inventory(inventory)