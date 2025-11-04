extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://houseRight.tscn")

func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://houseLeft.tscn")
	
func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://forest.tscn")
