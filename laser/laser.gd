extends Area2D
@onready var animation_player = $AnimationPlayer
@onready var score_sound = $ScoreSound


# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.on_game_over.connect(on_game_over)
	GameManager.on_score_updated.connect(on_score_updated)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func on_game_over():
	animation_player.stop()
	
func on_score_updated():
	score_sound.play()
	
