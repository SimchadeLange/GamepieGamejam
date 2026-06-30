extends Area2D

class_name InteractComponent

var in_interactable: HitboxComponent

func _ready() -> void:
	area_entered.connect(_on_interactable_entered)
	area_exited.connect(_on_interactable_exited)

func _on_interactable_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		in_interactable = area

func _on_interactable_exited(area: Area2D) -> void:
	if area is HitboxComponent:
		in_interactable = null
