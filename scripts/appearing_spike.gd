extends Area2D

func _ready(): 
	hide_spike() #start hidden

func _on_trigger_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print("Player triggered the spike!")
		reveal_spike()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print("Player hit the spike")
		body.respawn()

func reveal_spike(): 
	print("Spike appeared!")
	$Sprite2D.visible = true
	$CollisionPolygon2D.call_deferred("set_disabled", false)

func hide_spike(): 
	$Sprite2D.visible = false
	$CollisionPolygon2D.call_deferred("set_disabled", true)
