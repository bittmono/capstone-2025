extends CanvasLayer

var is_paused := false
@onready var pause_menu = $PanelContainer

func _ready():
	pause_menu.visible = false 
	is_paused = false
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func resume() -> void:
	get_tree().paused = false
	is_paused = false
	pause_menu.visible = false 
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func pause() -> void:
	get_tree().paused = true
	is_paused = true
	pause_menu.visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("paused"):
		if is_paused:
			resume()
		else:
			pause()

func _on_resume_pressed() -> void:
	resume()

func _on_main_menu_pressed():
	pass #add later
	
func _on_quit_pressed():
	get_tree().quit()
