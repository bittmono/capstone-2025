extends Node2D

@onready var label: Label = $Panel/Label
@onready var panel: Panel = $Panel

#are we near the sign? 
var player_near: bool = false

func _ready() -> void:
#instructions hidden initially
	panel.visible = false
	label.visible = false
	label.text = " "

func _on_trigger_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"): #changed so Player is not in folder
		label.text = "Welcome to the game!\nPress esc to pause\n Press W-A-S-D or Arrow Keys to move!"
		label.visible = true
		panel.visible = true
		player_near = true

func _on_trigger_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"): #changed so Player is not in folder
		label.visible = false 
		panel.visible = false
		player_near = false

func _process(_delta: float) -> void:
	if player_near and Input.is_action_just_pressed("bring_up_instructions"):
		show_instructions()

func show_instructions() -> void: 
	label.visible = true
	panel.visible = true
	label.text = "Here are the instructions:\nMove with WASD\nPress ESC to quit " #eventual instructions will be here, 
	  #could even be a splash screen.
