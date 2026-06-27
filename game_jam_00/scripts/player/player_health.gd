extends Damageable

@export var


func take_damage(amount: int) -> void:
	health -= amount
