extends Area2D

@onready var victory_song = $AudioStreamPlayer2D
@onready var canvas_modulate = $"../../../CanvasModulate"

func _on_body_entered(body):
	if body.is_in_group("Player"):
		if not victory_song.playing:
			# victory effects
			body.set_light_visibility(false)
			canvas_modulate.color = Color(1, 1, 1)  # Return to normal
			canvas_modulate.visible = false
			Music.stop()
			victory_song.play()
			
			#wait for victory song to finish playing
			get_tree().create_timer(4.0).timeout
			
			
