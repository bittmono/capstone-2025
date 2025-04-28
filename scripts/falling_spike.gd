extends RigidBody2D

@export var start_position: Vector2
@onready var timer: Timer = $Timer

var has_hit_player := false

func _ready() -> void:
	start_position = global_position
	contact_monitor = true #ensures contacts monitored
	max_contacts_reported = 1

func _on_trigger_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		set_deferred("freeze", false) #unfreeze spike, allow it to fall

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		has_hit_player = true
		body.die()
		timer.start()
	else:
		await get_tree().create_timer(0.5).timeout
		if not has_hit_player:
			queue_free()

func _on_timer_timeout() -> void:
	print("restarting game")
	get_tree().reload_current_scene()
