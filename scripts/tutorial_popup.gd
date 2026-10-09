extends PanelContainer

@export var text := 'tutorial instructions'

func _ready() -> void:
	if not Main.tutorial_mode:
		queue_free()
		return
	$VBoxContainer/Label.text = text
	$VBoxContainer/closeButton.pressed.connect(_close)

func _close() -> void:
	remove_from_group("tutorial")
	if get_tree().get_nodes_in_group("tutorial").is_empty():
		Main.tutorial_mode = false
	queue_free()
