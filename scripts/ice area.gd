extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		body.on_ice = true
		print("Player entered ice")  # Debug

func _on_body_exited(body):
	if body.name == "Player":
		body.on_ice = false
		print("Player exited ice")  # Debug
