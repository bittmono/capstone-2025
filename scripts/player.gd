extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -320.0
const NORMAL_FRICTION = 20.0
const ICE_FRICTION = 0.0   # slip
const ICE_ACCELERATION = 100.0 
const ICE_MAX_SPEED = 500.0


var is_alive = true
var has_played_death_animation = false
var is_vanishing = false
var has_played_vanish_animation = false
var on_ice = false

@onready var animated_sprite = $AnimatedSprite2D
@export var start_position: Vector2

@onready var jump_sound: AudioStreamPlayer2D = $JumpSound #jump.wav
@onready var death_sound: AudioStreamPlayer2D = $DeathSound #explosion.wav


func _ready(): 
	start_position = global_position

func die():
	print("player died")
	is_alive = false
	death_sound.play()

func update_status():
	if is_alive == false and not has_played_death_animation:
		print("playing death animation")
		animated_sprite.play("death")
		has_played_death_animation = true

func vanish():
	if is_alive and not is_vanishing:
		print("player teleporting")
		is_vanishing = true

func update_vanish_status():
	if is_vanishing and not has_played_vanish_animation:
		print("playing animation")
		animated_sprite.play("vanish")
		has_played_vanish_animation = true
		set_collision_mask_value(1, false) #disable movement during vanish

func ready():
	is_alive = true
	has_played_death_animation = false
	is_vanishing = false
	has_played_vanish_animation = false
	animated_sprite.play("idle")

func _physics_process(delta):
	# Handles vanishing regardless of status
	update_vanish_status()
	
	# Stops all movement if player is dead
	if not is_alive or is_vanishing: 
		update_status()
		return
	
	# Add the gravity.
	var gravity_vec = get_gravity()
	if not is_on_floor():
		velocity.y += gravity_vec.y * delta # Applies to vertical gravity

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_sound.play()

	# Get the input direction
	var direction = Input.get_axis("move_left", "move_right")
	
	# Flip sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")

	
	# If walking on ice
	if on_ice and is_on_floor():
		# Ice movement
		if direction:
			# Accelerates slowly, can build up speed
			velocity.x += direction * ICE_ACCELERATION * delta
			velocity.x = clamp(velocity.x, -ICE_MAX_SPEED, ICE_MAX_SPEED)
		else:
			velocity.x = move_toward(velocity.x, 0, ICE_FRICTION)
	else:
		# Normal movement
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, NORMAL_FRICTION)
	
	move_and_slide()
		
