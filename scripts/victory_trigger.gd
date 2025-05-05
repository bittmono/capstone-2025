extends Area2D

signal victory_reached


@onready var victory_song: AudioStreamPlayer2D = $VictorySong
@onready var canvas_modulate: CanvasModulate = $"../../CanvasModulate"


func _ready():
	print("Victory song node: ", victory_song)

func _on_body_entered(body):
	if body.is_in_group("Player"):
		if not victory_song.playing:
			#victory effects
			body.set_light_visibility(false)
			canvas_modulate.color = Color(1,1,1)
			
			canvas_modulate.visible = false
			Music.stop()
			victory_song.play()
			
			get_tree().create_timer(4.0).timeout
			emit_signal("victory_reached")
