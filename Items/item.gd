extends Sprite2D

var picked_up = false  # Item is in inventory
var dragging = false   # Item is being dragged by mouse
var drop_location_id = 0
var drop_location
@export var item_id = 1

func _physics_process(delta):
	if dragging:
		# Follow the mouse while dragging
		global_position = lerp(global_position, get_global_mouse_position(), 30 * delta)
	elif picked_up:
		# Snap back to inventory slot if not dragging
		drop_location = Inventory.get_slot_position(drop_location_id - 1)
		global_position = lerp(global_position, drop_location, 20 * delta)

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if not picked_up:
				# Pick up from scene into inventory
				var slot_index = Inventory.add_item(self)
				if slot_index != -1:
					drop_location_id = slot_index + 1
					picked_up = true
					# Reparent to inventory autoload
					if get_parent() != Inventory:
						get_parent().remove_child(self)
						Inventory.add_child(self)
			else:
				# Start dragging from inventory
				dragging = true
				z_index = 10
		else:
			# Mouse released → stop dragging
			dragging = false
