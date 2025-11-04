extends Node2D

var slot_1_filled = false
var slot_2_filled = false
var slot_3_filled = false
var slot_4_filled = false
var slot_5_filled = false

func fill_slot(slot):
	match slot:
		1: slot_1_filled = true
		2: slot_2_filled = true
		3: slot_3_filled = true
		4: slot_4_filled = true
		5: slot_5_filled = true

func empty_slot(slot):
	match slot:
		1: slot_1_filled = false
		2: slot_2_filled = false
		3: slot_3_filled = false
		4: slot_4_filled = false
		5: slot_5_filled = false
		
		
func choose_slot(item):
	var chosen_slot = 1
	if !slot_1_filled:
		chosen_slot = $InventorySlot1.global_position
		slot_1_filled = true
		item.drop_location_id = 1
		
	elif !slot_2_filled:
		chosen_slot = $InventorySlot2.global_position
		slot_2_filled = true
		item.drop_location_id = 2
		
	return chosen_slot
	
func set_drop_location(item):
	var drop_location
	match item.drop_location_id:
		0: drop_location = item.global_position
		1: drop_location = $InventorySlot1.global_position
		2: drop_location = $InventorySlot2.global_position
	return drop_location



func _on_area_2d_area_entered(area):
	if area.is_in_group("item") and !slot_1_filled:
		empty_slot(area.get_parent().drop_location_id)
		area.get_parent().drop_location_id = 1
		fill_slot(area.get_parent().drop_location_id)
		


func _on_area_2d_2_area_entered(area):
	if area.is_in_group("item") and !slot_2_filled:
		empty_slot(area.get_parent().drop_location_id)
		area.get_parent().drop_location_id = 2
		fill_slot(area.get_parent().drop_location_id)
