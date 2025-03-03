extends AnimatableBody2D

var triggered = false
var move_speed = 490
var move_direction = Vector2.LEFT  
var max_distance = 53              # Maximum distance to move
var distance_moved = 0             # Track how far the platform has moved

# Ensure the signal is only connected once
# Attempting to connect multiple times will crash the game 
func _ready() -> void:
	if not $TriggerArea.body_entered.is_connected(_on_trigger_area_body_entered):
		$TriggerArea.body_entered.connect(_on_trigger_area_body_entered)
	
# Move the platform in the specified direction 
# within a certain distance
func _process(delta):
	if triggered and distance_moved < max_distance:
		var movement = move_direction * move_speed * delta
		position += movement
		distance_moved += movement.length()

# Check if the body is the player and if the platform hasn't been triggered yet
func _on_trigger_area_body_entered(body):
	if body.name == "Player" and not triggered:
		triggered = true
