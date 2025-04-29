extends Area2D

@onready var victory_song: AudioStreamPlayer2D = $VictorySong

# when the player enters the victory zone, it'll trigger the victory sound.
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		# if the song isn't already playing, play the song 
		# (prevents repeating sound if the player goes back and forth in the area)
		if not victory_song.playing:
			# stop the global music track
			Music.stop()
			#play the victory sound
			victory_song.play()
	
