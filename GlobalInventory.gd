extends Node

# Store references to items in 5 slots
var slots = [null, null, null, null, null]

# Add an item to the first available slot
func add_item(item):
	for i in range(slots.size()):
		if slots[i] == null:
			slots[i] = item
			item.drop_location_id = i + 1
			return i
	return -1  # inventory full

# Remove an item from a slot
func remove_item(slot_index: int):
	if slot_index >= 0 and slot_index < slots.size():
		slots[slot_index] = null
