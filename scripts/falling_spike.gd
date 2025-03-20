extends RigidBody2D

@export var start_position: Vector2

func _ready() -> void:
	start_position = global_position
	contact_monitor = true #ensures contacts monitored
	max_contacts_reported = 1

func _on_trigger_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		set_deferred("freeze", false) #unfreeze spike, allow it to fall

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		print("Spike hit the player!")
		body.respawn()
		reset_spike()

func reset_spike(): 
	await get_tree().create_timer(1.0).timeout #delay before reset
	freeze = true #reset spike
	global_position = start_position #move spike back to start position
	linear_velocity = Vector2.ZERO #stop movement
