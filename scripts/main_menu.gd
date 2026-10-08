extends Control

func _ready() -> void:
    %play.pressed.connect(play)

func play() -> void:
    get_tree().change_scene_to_file('res://main.tscn')
