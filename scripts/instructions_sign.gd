extends Node2D

@onready var prompt_label = $Label
@onready var instructions_label = $RichTextLabel

#are we near the sign? 
var player_near: bool = false

func _ready() -> void:
#instructions hidden initially
	instructions_label.visible = false
	prompt_label.text = " "

func _on_trigger_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"): #changed so Player is not in folder
		prompt_label.text = "Welcome to the game!
		Press I for instructions!"
		prompt_label.visible = true
		player_near = true

func _on_trigger_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"): #changed so Player is not in folder
		prompt_label.visible = false 
		instructions_label.visible = false
		player_near = false

func _process(_delta: float) -> void:
	if player_near and Input.is_action_just_pressed("bring_up_instructions"):
		show_instructions()

func show_instructions() -> void: 
	instructions_label.visible = true
	instructions_label.text = " " #eventual instructions will be here, 
	  #could even be a splash screen.
