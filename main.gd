extends Node2D

func _ready() -> void:
	remove_picked_up_items_from_scene()

func remove_picked_up_items_from_scene():
	# Loop through all children in the scene
	for child in get_children():
		# Check if child is an item (assuming all items extend Sprite2D and have item_id)
		if child is Sprite2D and child.has_method("item_id"):
			# Check if this item is already in Inventory
			var already_in_inventory = false
			for slot_item in Inventory.slots:
				if slot_item != null and slot_item == child:
					already_in_inventory = true
					break
			# If item is in inventory, remove it from the scene
			if already_in_inventory:
				remove_child(child)
				
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://houseRight.tscn")

func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://houseLeft.tscn")
	
func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://forest.tscn")
