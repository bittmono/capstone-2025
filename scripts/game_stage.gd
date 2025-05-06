extends Node2D

var normal_color = Color(1, 1, 1)  # regular

var elapsed_time := 0.0
var timer_running := false

@onready var timer_label = $UILayer/Label
@onready var pause_menu = $"Pause Menu"
@onready var victory_trigger = $"Obstacles/Stage Five - Obstacles/victory_trigger"

func _ready():
	$CanvasModulate.color = Color(1, 1, 1) 
	start_timer()
	victory_trigger.connect("victory_reached", Callable(self, "_on_victory_reached"))
	
func _process(delta): 
	if timer_running and not get_tree().paused:
		elapsed_time += delta
		var minutes = int(elapsed_time) / 60
		var seconds = int(elapsed_time) % 60
		timer_label.text = "Time: %d:%02d" % [minutes, seconds]

func start_timer(): 
	elapsed_time = 0.0
	timer_running = true

func _input(event):
	if event.is_action_pressed("paused"):
		get_tree().paused = not get_tree().paused
		pause_menu.visible = get_tree().paused 

func stop_timer(): 
	timer_running = false

func _on_victory_reached(): 
	stop_timer()
	
	
	
