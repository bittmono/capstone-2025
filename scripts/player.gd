extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -320.0
const RESPAWN_POINT: Vector2 = Vector2(-200, 0) 

var is_alive = true
var has_played_death_animation = false

@onready var animated_sprite = $AnimatedSprite2D
@export var start_position: Vector2

func die():
	print("player died")
	is_alive = false

func update_status():
	if is_alive == false and not has_played_death_animation:
		print("playing death animation")
		animated_sprite.play("death")
		has_played_death_animation = true

func _ready(): 
	start_position = global_position

func _physics_process(delta):
	# Stops all movement if player is dead
	if not is_alive: 
		update_status()
		return
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

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
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()


func respawn(): 
	global_position = RESPAWN_POINT #the players initial spawn point
	modulate = Color.WHITE
