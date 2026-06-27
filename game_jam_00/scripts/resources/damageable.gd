extends Node

class_name Damageable

@export var character: PhysicsBody2D
@export var hit_state: State
@export var health: int


func _ready() -> void:
	pass # Replace with function body.


func take_damage(amount: int) -> void:
	health -= amount
