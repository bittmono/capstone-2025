extends Node2D

@onready var timer = $Timer 
@onready var label = $Label  # Reference to the Label
var player_near: bool = false  # Track if player is near the sign
var player_body: Node2D = null

func _ready() -> void:
	label.visible = false
	label.text = ""

func _on_trigger_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		label.text = "Press Z for additional info"  # Set prompt text
		label.visible = true  # Show prompt
		player_near = true
		player_body = body #stores player ref

func _on_trigger_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		label.visible = false  # Hide prompt when player leaves
		player_near = false
		player_body = null #clears player ref

func _process(_delta: float) -> void:
	if player_near and Input.is_action_just_pressed("send_player_to_spawn"):
		print("z key pressed") #debug
		if player_body != null:
			player_body.vanish()
			timer.start()

func _on_timer_timeout():
	print("restarting game")
	get_tree().call_deferred("reload_current_scene")
