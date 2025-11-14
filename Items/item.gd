extends Sprite2D

var dragging = false
var picked_up = false
var drop_location_id = 0
var drop_location
@export var item_id = 1
var dropped = false
var timer_off = true

func _physics_process(delta):
	if dragging:
		global_position = lerp(global_position, get_global_mouse_position(), 30 * delta)
		dropped = false
	elif picked_up:
		if !dropped:
			drop_location = Inventory.get_slot_position(drop_location_id - 1)
			if timer_off:
				$Timer.start()
				timer_off = false
		global_position = lerp(global_position, drop_location, 20 * delta)

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if !picked_up and !dragging:
			var slot_index = Inventory.add_item(self)
			if slot_index != -1:
				drop_location_id = slot_index + 1
				z_index = 10
				picked_up = true
		else:
			if event.pressed:
				dragging = true
			else:
				dragging = false

func _on_timer_timeout() -> void:
	dropped = true
