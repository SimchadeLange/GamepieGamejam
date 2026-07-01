extends Node

class_name FlashComponent

@export var sprites: Array[Sprite2D]


func flash() -> void:
	sprites.all(_modulate_flash)

func _modulate_flash(sprite: Sprite2D) -> void:
	if sprite.self_modulate != Color(18.892, 18.892, 18.892, 1.0):
		sprite.self_modulate = Color(18.892, 18.892, 18.892, 1.0)
	else:
		sprite.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
