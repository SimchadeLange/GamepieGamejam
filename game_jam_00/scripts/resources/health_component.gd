extends Node

class_name HealthComponent

@export var health: int
signal on_damage(attack: Attack)
signal on_death

func damage(attack: Attack) -> void:
	health -= attack.attack_damage
	if health > 0:
		on_damage.emit(attack)
	else:
		on_death.emit()
		queue_free()
