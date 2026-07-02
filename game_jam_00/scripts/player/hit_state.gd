extends State

@export var idle_state: State
@export var flash_component: FlashComponent
@export var hit_stun_duration_timer: Timer

func _ready() -> void:
	hit_stun_duration_timer.timeout.connect(_on_hit_duration_timeout)

func on_enter() -> void:
	hit_stun_duration_timer.start()
	flash_component.flash()

func on_exit() -> void:
	hit_stun_duration_timer.stop()
	hit_stun_duration_timer.wait_time = 0.2

func _on_hit_duration_timeout() -> void:
	next_state = idle_state
