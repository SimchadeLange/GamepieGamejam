extends State

@export var idle_state: State
@export var attack_duration_timer: Timer
#var weapon: Weapon

func _ready() -> void:
	attack_duration_timer.timeout.connect(_on_attack_duration_timeout)

func on_enter() -> void:
	#weapon = character.weapon
	#weapon.process_mode = Node.PROCESS_MODE_INHERIT
	attack_duration_timer.start()

func on_exit() -> void:
	#weapon.process_mode = Node.PROCESS_MODE_DISABLED
	attack_duration_timer.stop()

func _on_attack_duration_timeout() -> void:
	next_state = idle_state
