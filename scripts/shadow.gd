extends Button

@onready var shadow := %shadow

func _on_pressed() -> void:
    shadow.frame = 2
