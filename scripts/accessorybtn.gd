extends Button

@export var worn_tex: Texture2D

var sprite: Sprite2D

func _ready() -> void:
	for state in ["hover", "pressed", "focus"]:
		add_theme_stylebox_override(state, get_theme_stylebox("normal"))
		
	sprite = Sprite2D.new()
	sprite.texture = worn_tex
	sprite.position = Vector2(-200, 24)
	sprite.scale = Vector2(0.2, 0.2)
	sprite.visible = false
	%wornAccessories.add_child.call_deferred(sprite)
	pressed.connect(func(): sprite.visible = not sprite.visible)
