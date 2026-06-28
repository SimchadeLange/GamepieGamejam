extends Area2D

class_name Weapon

@export var hurtbox: CollisionShape2D

func _ready() -> void:
	area_entered.connect(_on_weapon_area_entered)
	process_mode = Node.PROCESS_MODE_DISABLED

func _on_weapon_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		var hitbox: HitboxComponent = area
		var attack := Attack.new()
		attack.attack_damage = 1
		attack.attack_pos = global_position
		hitbox.damage(attack)
