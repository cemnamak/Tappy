extends Control
@onready var score_label = $MC/HBoxContainer/ScoreLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.on_score_updated.connect(on_score_updated)
	on_score_updated()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func on_score_updated():
	score_label.text = str(GameManager.get_score())
	
