extends Area2D

@onready var fireworkgreen = $fireworks/AnimatedSprite2D1
@onready var victory_song = $AudioStreamPlayer2D
@onready var canvas_modulate = $"../../../CanvasModulate"
@onready var victory_message = $"../../../VictoryMessage"
signal victory_reached


func _on_body_entered(body):
	if body.is_in_group("Player"):
		if not victory_song.playing:
			# victory effects
			emit_signal("victory_reached")
			body.set_light_visibility(false)
			canvas_modulate.color = Color(1, 1, 1)  # Return to normal
			canvas_modulate.visible = false
			Music.stop()
			victory_song.play()
			
			#play fireworks and display message
			victory_message.visible = true
			fireworkgreen.play("green")
			
			#wait for victory song to finish playing
			get_tree().create_timer(4.0).timeout
			
			
