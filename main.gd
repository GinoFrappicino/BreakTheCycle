extends Node2D

var item = preload("res://Items/item.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_initial_items()

func spawn_initial_items():
	var item = item.instantiate()
	Inventory.add_item(item)  # this makes it persist



func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://houseRight.tscn")

func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://houseLeft.tscn")
	
func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://forest.tscn")
