extends Area2D
@onready var timer = $Timer

#not sure what the purpose of this code is for
func _ready(): 
	connect("body_entered", Callable(self, "on_body_entered"))

#if a player hits the spikes, they get reset back to spawn
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.die() 
		timer.start()

func _on_timer_timeout():
	print("restarting game")
	get_tree().call_deferred("reload_current_scene")
