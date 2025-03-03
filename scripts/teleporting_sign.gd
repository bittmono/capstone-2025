extends Node2D

@export var teleport_position: Vector2 = Vector2(-200, 0)  # Set teleport position to (0,0)

@onready var label = $Label  # Reference to the Label
var player_near: bool = false  # Track if player is near the sign

func _ready() -> void:
	label.visible = false
	label.text = ""

func _on_trigger_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		label.text = "Press Z for additional info"  # Set prompt text
		label.visible = true  # Show prompt
		player_near = true

func _on_trigger_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		label.visible = false  # Hide prompt when player leaves
		player_near = false

func _process(delta: float) -> void:
	if player_near and Input.is_action_just_pressed("send_player_to_spawn"):
		teleport_player()

func teleport_player() -> void:
	print("Teleport function triggered")  # Debugging step

	var players = get_tree().get_nodes_in_group("Player")
	if players.is_empty():
		print("No players found in 'Player' group!")  # Debugging
		return

	for body in players:
		body.global_position = teleport_position  # Move player to (0,0)
		print("Player teleported to:", body.global_position) 
