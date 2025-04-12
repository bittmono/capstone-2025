extends StaticBody2D


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		body.on_ice = true
		pass



func _on_area_2d_body_exited(body):
	if body.name == "Player":
		body.on_ice = false
		pass 
