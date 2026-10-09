extends Control

func _ready() -> void:
	%back.pressed.connect(back)

func back() -> void:
	get_tree().change_scene_to_file(Main.previous_scene_path)
