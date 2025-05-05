extends Area2D

@export var enable_darkness := false
@onready var canvas_modulate = $"../CanvasModulate"


func _on_body_entered(body):
	if body.has_method("set_light_visibility"):
		body.set_light_visibility(true)
		canvas_modulate.color = Color(0, 0, 0) 
		canvas_modulate.visible = true
	#if enable_darkness:
	#	get_tree().root.find_child("CanvasModulate", true, false).color = Color(0,0,0)

func _on_body_exited(body):
	if body.has_method("set_light_visibility"):
		body.set_light_visibility(false)
		canvas_modulate.color = Color(1, 1, 1)  # Return to normal
		canvas_modulate.visible = false
	#if enable_darkness:
	#	get_tree().root.find_child("CanvasModulate", true, false).color = Color(1,1,1)
