extends CharacterBody2D

const SPEED: float = 20.0

@export var state_machine: CharacterStateMachine
@export var movement_component: MovementComponent
@export var health_component: HealthComponent
@export var sprite: Sprite2D

func _ready() -> void:
	health_component.on_death.connect(dead)

func _physics_process(delta: float) -> void:
	movement_component.movement_process(delta)
	
	if movement_component.prev_dir.x > 0:
		sprite.flip_h = false
	elif movement_component.prev_dir.x < 0:
		sprite.flip_h = true

func dead() -> void:
	print("dead")
