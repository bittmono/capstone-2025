extends Node2D

const SPEED = 60

var direction = 1

@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_right.is_colliding():
		direction = -1 #colliding right, move left
		animated_sprite_2d.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1 #colliding left, move right
		animated_sprite_2d.flip_h = false 
	
	position.x += direction * SPEED * delta
	
