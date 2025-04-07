extends RigidBody2D

@export var start_position: Vector2
@onready var timer = $Timer

func _ready() -> void:
	start_position = global_position
	contact_monitor = true #ensures contacts monitored
	max_contacts_reported = 1

func _on_trigger_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		set_deferred("freeze", false) #unfreeze spike, allow it to fall

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		#body.die() plays death animation, but doesnt respawn properly
		print("Spike hit the player!")
		body.die()
		timer.start()

func _on_timer_timeout():
	print("restarting game")
	get_tree().call_deferred("reload_current_scene")
