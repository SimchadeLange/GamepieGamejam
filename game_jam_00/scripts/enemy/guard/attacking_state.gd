extends State

@export var attack_component: AttackComponent
@export var pathfinding_component: PathfindingComponent
@export var attack_duration_timer: Timer
@export var attack_cooldown_timer: Timer
@export var chasing_state: State

func _ready() -> void:
	attack_cooldown_timer.timeout.connect(_on_attack_cooldown_timeout)
	attack_duration_timer.timeout.connect(_on_attack_duration_timeout)

func on_enter() -> void:
	attack_duration_timer.start()

func on_exit() -> void:
	attack_duration_timer.stop()
	attack_cooldown_timer.stop()

func _on_attack_duration_timeout() -> void:
	var attack := Attack.new()
	attack.attack_damage = 5
	attack_component.do_attack(attack)
	attack_cooldown_timer.start()

func _on_attack_cooldown_timeout() -> void:
	if character.global_position.distance_to(
			pathfinding_component.target.global_position) < 30 and \
				pathfinding_component.target.health_component:
		on_exit()
		on_enter()
	else:
		next_state = chasing_state
