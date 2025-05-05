extends Area2D
@onready var timer = $Timer

func _ready(): 
	hide_spike() #start hidden
func reveal_spike(): 
	print("Spike appeared!")
	$Sprite2D.visible = true
	$CollisionPolygon2D.call_deferred("set_disabled", false)
func hide_spike(): 
	$Sprite2D.visible = false
	$CollisionPolygon2D.call_deferred("set_disabled", true)
	
func _on_trigger_area_body_entered(body):
	if body.is_in_group("Player"):
		reveal_spike()

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.die() #calls the death animation only
		timer.start()

func _on_timer_timeout():
	print("restarting game")
	get_tree().reload_current_scene() #restarts scene
