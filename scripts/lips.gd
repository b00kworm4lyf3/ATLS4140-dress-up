extends Button

@onready var lips := %lips

func _on_pressed() -> void:
    lips.frame = 2
