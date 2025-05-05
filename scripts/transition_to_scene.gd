extends CanvasLayer

signal transition_completed

func transition():
	$AnimationPlayer.play("fade_to_black")
	
func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		emit_signal("transition_completed")
