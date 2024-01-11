extends Node2D





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= GameManager.scroll_speed * delta

func _on_screen_exited():
	queue_free()

func _on_body_entered(body):
	if body.is_in_group(GameManager.GROUP_PLANE):
		body.die()
	pass # Replace with function body.


func _on_laser_body_entered(body):
	if body.is_in_group(GameManager.GROUP_PLANE):
		GameManager.increment_score()
		GameManager.scroll_speed += GameManager.pipe_scroll_factor
		

	
