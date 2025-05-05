extends CanvasLayer

var is_paused := false
@onready var pause_menu = $"."

@onready var master_slider = $"Settings/master slider"
@onready var music_slider = $"Settings/music slider"
@onready var sfx_slider = $"Settings/sfx slider"


func _ready():
	get_tree().paused = false
	is_paused = false
	pause_menu.visible = false 
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

	# Initialize sliders with current values
	master_slider.value = SettingsManager.master_volume
	music_slider.value = SettingsManager.music_volume
	sfx_slider.value = SettingsManager.sfx_volume
	
	# Connect signals
	master_slider.value_changed.connect(_on_master_changed)
	music_slider.value_changed.connect(_on_music_changed)
	sfx_slider.value_changed.connect(_on_sfx_changed)

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


func _on_master_changed(value: float):
	SettingsManager.master_volume = value
	SettingsManager.apply_audio_settings()
	SettingsManager.save_settings() 

func _on_music_changed(value: float):
	SettingsManager.music_volume = value
	SettingsManager.apply_audio_settings()
	SettingsManager.save_settings() 
	
func _on_sfx_changed(value: float):
	SettingsManager.music_volume = value
	SettingsManager.apply_audio_settings()
	SettingsManager.save_settings() 

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("paused"):
		if is_paused:
			resume()
		else:
			pause()

func _on_resume_pressed() -> void:
	resume()
	
func _on_quit_pressed():
	get_tree().quit()
