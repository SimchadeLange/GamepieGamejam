extends Node

class_name FlashComponent

@export var flicker_time: float = 0.1
var flash_timer := Timer.new()
@export var sprites: Array[Sprite2D]

func _ready() -> void:
	flash_timer.wait_time = flicker_time
	add_child(flash_timer)
	flash_timer.one_shot = true

func flash() -> void:
	for i in range(4):
		sprites.all(_modulate_flash)
		flash_timer.start()
		await flash_timer.timeout

func _modulate_flash(sprite: Sprite2D) -> void:
	if sprite.self_modulate != Color(18.892, 18.892, 18.892, 1.0):
		sprite.self_modulate = Color(18.892, 18.892, 18.892, 1.0)
	else:
		sprite.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
