extends ParallaxBackground

var speed:float = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.on_game_over.connect(on_game_over)
	GameManager.on_score_updated.connect(on_score_updated)
	speed = GameManager.scroll_speed
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_offset.x += speed * delta * -1
	pass

func on_game_over()-> void:
	set_process(false)

func on_score_updated()->void:
	if speed < 250:
		speed += 0.5
