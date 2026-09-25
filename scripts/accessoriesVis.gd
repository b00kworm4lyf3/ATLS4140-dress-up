extends Node2D

@onready var pages := $pages.get_children()

var page := 0

func _ready() -> void:
    $leftButton.pressed.connect(func(): _change_page(-1))
    $rightButton.pressed.connect(func(): _change_page(1))
    _show_page(0)

func _change_page(step: int) -> void:
    page = wrapi(page + step, 0, pages.size())
    _show_page(page)

func _show_page(p: int) -> void:
    for i in pages.size():
        pages[i].visible = (i == p)
        
