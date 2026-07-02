extends Area2D

class_name HitboxComponent

signal on_interact

@export var health_component: HealthComponent
@export var movement_component: MovementComponent
@export var is_interactable: bool = false

func damage(attack: Attack) -> void:
	if health_component:
		health_component.damage(attack)
	if movement_component:
		movement_component.knockback(attack.attack_dir,
			attack.knockback_force, attack.stun_duration)

func interact() -> void:
	if is_interactable:
		on_interact.emit()
