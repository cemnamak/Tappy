extends Control
@onready var game_over_label = $GameOverLabel
@onready var press_space = $PressSpace
@onready var timer = $Timer

var _can_press_space:bool = false
@onready var game_over_sound = $GameOverSound

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.on_game_over.connect(on_game_over)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _can_press_space == true:
		if Input.is_action_just_pressed("fly"):
			GameManager.load_main_scene()

func on_game_over()-> void:
	show()
	game_over_sound.play()
	timer.start()
	
func run_sequence()-> void:
	game_over_label.hide()
	press_space.show()
	_can_press_space =true

func _on_timer_timeout():
	run_sequence()
