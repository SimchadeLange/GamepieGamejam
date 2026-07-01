extends Area2D

class_name HitboxComponent

signal on_interact

@export var health_component: HealthComponent
@export var is_interactable: bool = false

func damage(attack: Attack) -> void:
	if health_component:
		health_component.damage(attack)

func interact() -> void:
	if is_interactable:
		on_interact.emit()
