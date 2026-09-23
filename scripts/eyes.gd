extends Button

@onready var eyes := %eyes

func _on_pressed() -> void:
	eyes.frame = 0
