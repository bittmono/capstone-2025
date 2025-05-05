extends Control

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/game stage.tscn")

func _on_quit_pressed():
	get_tree().quit()
