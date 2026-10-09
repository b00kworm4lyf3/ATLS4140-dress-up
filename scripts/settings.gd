extends Control

func _ready() -> void:
	%back.pressed.connect(back)
	$MusicSlider.value = Main.music.volume_linear
	$SFXSlider.value = Main.click.volume_linear

func back() -> void:
	get_tree().change_scene_to_file(Main.previous_scene_path)


func _on_music_slider_value_changed(value: float) -> void:
	Main.music.volume_linear = %MusicSlider.value


func _on_sfx_slider_value_changed(value: float) -> void:
	Main.click.volume_linear = %SFXSlider.value
