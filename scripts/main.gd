extends Node

var clothing_list := []
var click := AudioStreamPlayer.new()
var done_mode := false

func _ready() -> void:
    clothing_list = get_tree().get_nodes_in_group("clothing")

    click.stream = preload("res://assets/sound/zipclick.wav")
    click.bus = &"Sound Effects"
    add_child(click)
    
    for button in get_tree().root.find_children("*", "Button", true, false):
        button.pressed.connect(func():
            click.pitch_scale = 1.4
            click.play())


func _order_clothing_list() -> void:
    for count in range(clothing_list.size()):
        clothing_list[count].z_index = count
        clothing_list[count].get_child(0).z_index = count
