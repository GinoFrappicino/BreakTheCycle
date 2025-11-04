extends Node2D

func _on_button_1_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")

func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://town.tscn")

func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://forestHunter.tscn")
