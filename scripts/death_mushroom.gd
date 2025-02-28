extends Area2D
@onready var timer = $Timer

func _on_body_entered(body):
	if body.is_in_group("Player"):
		print("You Died!")
		timer.start()
		
func _on_timer_timeout():
	get_tree().call_deferred("reload_current_scene")
