extends Sprite2D

@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var area_2d: Area2D = $Area2D

var dragging := false
var off := Vector2.ZERO

@export var perfect_pos := Vector2(-200, 24)
@export var pos_forgive := Vector2(50, 50)

func _process(_delta: float) -> void:
	if dragging:
		position = get_global_mouse_position() - off

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			var params := PhysicsPointQueryParameters2D.new()
			params.position = get_global_mouse_position()
			params.collide_with_areas = true

			var object_clicked = get_world_2d().direct_space_state.intersect_point(params)
			var colliders = object_clicked.map(
				func(dict):
					return dict.collider
			)
			colliders.sort_custom(
				func(c1, c2):
					return c1.z_index < c2.z_index
			)
			if colliders[-1] == area_2d:
				dragging = true
				off = get_global_mouse_position() - global_position

				#reorder z index
				var prev_last = Main.clothing_list[-1]
				if self != prev_last:
					Main.clothing_list.erase(self)
					Main._order_clothing_list()
					Main.clothing_list.append(self)
					self.z_index = Main.clothing_list.size()
					area_2d.z_index = Main.clothing_list.size()
				audio_player.pitch_scale = 1.4
				audio_player.play()
		elif event.pressed == false and (position-perfect_pos).length() < pos_forgive.length():
			dragging = false
			position = perfect_pos
			audio_player.pitch_scale = 0.6
			audio_player.play()

		elif event.pressed == false:
			dragging = false
			audio_player.pitch_scale = 0.6
			audio_player.play()


	


func _on_button_pressed() -> void:
	pass # Replace with function body.
