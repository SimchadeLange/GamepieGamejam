extends State

@export var attack_component: AttackComponent
@export var attack_duration_timer: Timer
@export var chasing_state: State

func _ready() -> void:
	attack_duration_timer.timeout.connect(_on_attack_duration_timeout)

func on_enter() -> void:
	attack_duration_timer.start()

func on_exit() -> void:
	attack_duration_timer.stop()

func _on_attack_duration_timeout() -> void:
	var attack := Attack.new()
	attack.attack_damage = 5
	attack_component.do_attack(attack)
	next_state = chasing_state
