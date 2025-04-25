extends CanvasLayer

@onready var color_rect = $ColorRect
@onready var vision_light = $ColorRect/VisionLight

# Called when the node enters the scene tree for the first time.
func _ready():
	color_rect.color = Color(0, 0, 0, 0)  # Transparent
	vision_light.enabled = false

func enable_limited_vision():
	print("Enabling vision mask")
	color_rect.color = Color(0, 0, 0, 1)
	vision_light.enabled = true
	vision_light.visible = true

func disable_limited_vision():
	print("Disabling vision mask")
	color_rect.color = Color(0, 0, 0, 0)
	vision_light.enabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if vision_light.enabled:
		#test
		vision_light.position = get_viewport().size / 2
		vision_light.energy = 5.0  # Make it bright
		#print("TEST: Light at screen center", vision_light.position)
		
		var player = get_node_or_null("/root/Game/Player")
		if player:
			var camera = get_viewport().get_camera_2d()
			var player_screen_pos = camera.get_screen_center_position() + (player.global_position - camera.global_position)
			
			var viewport_size = get_viewport().size
			player_screen_pos = player_screen_pos.clamp(Vector2.ZERO, viewport_size)
			
			# Debug output
			print("Light position (local): ", vision_light.position)
			print("Player position (world): ", player.global_position)
			print("Camera position: ", camera.global_position)
			
