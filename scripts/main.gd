extends Node

var clothing_list := []
var click := AudioStreamPlayer.new()
var done_mode := false
var music := AudioStreamPlayer.new()
var tutorial_mode := false

var previous_scene_path: String = ""

func _ready() -> void:	
	music.stream = preload("res://assets/sound/Nicraftin_-_December_River.wav")
	music.volume_db = -14.0
	music.bus = &"Music"
	add_child(music)
	music.play()
	
	click.stream = preload("res://assets/sound/zipclick.wav")
	click.bus = &"Sound Effects"
	add_child(click)

	get_tree().node_added.connect(_on_node_added)
	# catch any buttons that already exist when this runs
	for button in get_tree().root.find_children("*", "Button", true, false):
		_hook_button(button)

func _on_node_added(node: Node) -> void:
	if node is Button:
		_hook_button(node)

func _hook_button(button: Button) -> void:
	if not button.pressed.is_connected(_play_click):
		button.pressed.connect(_play_click)

func _play_click() -> void:
	click.pitch_scale = 1.4
	click.play()


func _order_clothing_list() -> void:
	for count in range(clothing_list.size()):
		clothing_list[count].z_index = count
		clothing_list[count].get_child(0).z_index = count
