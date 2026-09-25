extends Button

const HOME_POS := Vector2(-125, 24)
const HOME_SCALE := Vector2(0.2, 0.2)
const DONE_POS := Vector2(0, -50)
const DONE_SCALE := Vector2(0.25, 0.25)

@onready var back_button := %backButton

var parts := []
var hidden_clothes := []

func _ready() -> void:
	back_button.pressed.connect(_exit_done)

func _on_pressed() -> void:
	Main.done_mode = true
	%ui.hide()

	parts = [%model, %shadow, %eyes, %lips]
	hidden_clothes = []
	for item in Main.clothing_list:
		if item.global_position == item.perfect_pos:
			parts.append(item)
		else:
			item.hide()
			hidden_clothes.append(item)
	for acc in %wornAccessories.get_children():
		if acc.visible:
			parts.append(acc)

	await _tween_parts(DONE_POS, DONE_SCALE).finished
	back_button.show()

func _tween_parts(pos: Vector2, scl: Vector2) -> Tween:
	var tw := create_tween().set_parallel().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	for p in parts:
		tw.tween_property(p, "position", pos, 0.6)
		tw.tween_property(p, "scale", scl, 0.6)
	return tw

func _exit_done() -> void:
	back_button.hide()
	await _tween_parts(HOME_POS, HOME_SCALE).finished
	%ui.show()

	for item in hidden_clothes:
		item.show()

	Main.done_mode = false
