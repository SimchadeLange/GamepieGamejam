extends Area2D

class_name AttackComponent

var in_hitbox: HitboxComponent

func _ready() -> void:
	area_entered.connect(_on_attack_area_entered)
	area_exited.connect(_on_attack_area_exited)

func do_attack(attack: Attack) -> void:
	if in_hitbox:
		in_hitbox.damage(attack)

func _on_attack_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		in_hitbox = area

func _on_attack_area_exited(area: Area2D) -> void:
	if area is HitboxComponent:
		in_hitbox = null
