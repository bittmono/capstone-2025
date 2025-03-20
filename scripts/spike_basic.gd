extends Area2D

func _ready(): 
	connect("body_entered", Callable(self, "on_body_entered"))

#if a player hits the spikes, they get reset back to spawn
func _on_body_entered(body: Node2D) -> void:
	print("Player hit the spike!")
	if body.is_in_group("Player"):
		body.respawn() 
