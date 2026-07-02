extends State

@export var idle_state: State
@export var attack_duration_timer: Timer
@export var interact_component: InteractComponent

func _ready() -> void:
	attack_duration_timer.timeout.connect(_on_attack_duration_timeout)

func on_enter() -> void:
	interact_component.in_interactable.interact()
	attack_duration_timer.start()

func on_exit() -> void:
	attack_duration_timer.stop()

func _on_attack_duration_timeout() -> void:
	var attack := Attack.new()
	attack.attack_damage = 10
	interact_component.in_interactable.damage(attack)
	next_state = idle_state
