extends Node2D

const SPEED = 120
const BOUNCE_FORCE = 3000

var direction = 1

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var bounce_zone: Area2D = $BounceZone
@onready var ground_check_left: RayCast2D = $GroundCheckLeft
@onready var ground_check_right: RayCast2D = $GroundCheckRight


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#check if there is ground in the direction we're moving
	if direction == 1 and not ground_check_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	elif direction == -1 and not ground_check_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	
	position.x += direction * SPEED * delta

func _on_bounce_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		var player = body as CharacterBody2D
		if player:
			var bounce_direction = direction
			var horizontal_bounce = BOUNCE_FORCE
			player.velocity.x += bounce_direction * horizontal_bounce
			player.move_and_slide() 
			
