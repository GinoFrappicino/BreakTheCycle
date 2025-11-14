extends CanvasLayer

# Persistent slots storing items
var slots = [null, null, null, null, null]
var slot_positions = []

func _ready():
	# Cache slot positions relative to CanvasLayer
	slot_positions = [
		$InventorySlot1.position,
		$InventorySlot2.position,
		$InventorySlot3.position,
		$InventorySlot4.position,
		$InventorySlot5.position
	]

	# Snap items already in slots
	for i in range(slots.size()):
		var item = slots[i]
		if item != null:
			if !item.get_parent():
				add_child(item)
			item.position = slot_positions[i]

# Add an item to the first empty slot
func add_item(item):
	for i in range(slots.size()):
		if slots[i] == null:
			slots[i] = item
			item.drop_location_id = i + 1
			if !item.get_parent():
				add_child(item)
			item.position = slot_positions[i]
			return i
	return -1  # inventory full

# Remove an item from a slot
func remove_item(slot_index):
	if slot_index >= 0 and slot_index < slots.size():
		slots[slot_index] = null

# Get slot position for items
func get_slot_position(slot_index):
	if slot_index >= 0 and slot_index < slot_positions.size():
		return slot_positions[slot_index]
	return Vector2.ZERO
