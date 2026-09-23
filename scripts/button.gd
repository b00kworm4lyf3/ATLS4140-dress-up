extends Button

@onready var model := %model

func _on_pressed() -> void:
	model.frame = 1
