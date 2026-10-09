extends Button

func _on_pressed() -> void:
	Main.previous_scene_path = get_tree().current_scene.scene_file_path
	get_tree().change_scene_to_file('res://settings.tscn')
