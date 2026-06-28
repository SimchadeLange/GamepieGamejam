extends CharacterBody2D

@export var state_machine: CharacterStateMachine
@export var health_component: HealthComponent

func _ready() -> void:
	health_component.on_death.connect(dead)

func dead() -> void:
	print("dead")
