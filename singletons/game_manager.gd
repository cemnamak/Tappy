extends Node

signal on_game_over
signal on_score_updated
var scroll_speed: float = 120
var pipe_scroll_factor:float = 0.5
var spawn_factor:float = 0.1
const GROUP_PLANE : String = "plane"

var _score:int = 0
var _high_score:int = 0

func set_score(v:int)->void:
	_score =v
	if _score > _high_score:
		_high_score = _score
	on_score_updated.emit()
	
func increment_score() -> void:
	set_score(_score + 1)

func get_score() -> int:
	return _score
	
func get_high_score()-> int:
	return _high_score

var game_scene: PackedScene = preload("res://game/game.tscn")
var main_scene: PackedScene = preload("res://main/Main.tscn")

func load_game_scene()-> void:
	get_tree().change_scene_to_packed(game_scene)
	
func load_main_scene()-> void:
	set_score(0)
	get_tree().change_scene_to_packed(main_scene)

