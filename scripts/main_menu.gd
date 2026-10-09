extends Control

func _ready() -> void:
	%play.pressed.connect(play)
	%settings.pressed.connect(settings)

func play() -> void:
	get_tree().change_scene_to_file('res://main.tscn')

func settings() -> void:
	Main.previous_scene_path = get_tree().current_scene.scene_file_path
	get_tree().change_scene_to_file('res://settings.tscn')
