extends CharacterBody2D
#signal on_plane_died


const GRAVITY:float = 1800.0
const POWER:float = -400.0
@onready var animation_player = $AnimationPlayer
@onready var animated_sprite_2d = $AnimatedSprite2D

var _dead:bool = false
@onready var engine_sound = $EngineSound
@onready var collision_shape_2d = $"../sky/CollisionShape2D"


func _physics_process(delta):
	velocity.y += GRAVITY * delta
	
	fly()
	move_and_slide()
	if is_on_floor():
		die()
	
func fly() -> void:
	if Input.is_action_just_pressed("fly"):
		velocity.y = POWER
		animation_player.play("fly")
		
func die()->void:
	if _dead:
		return
	_dead = true
	animated_sprite_2d.stop()
	engine_sound.stop()
	GameManager.on_game_over.emit()
	set_physics_process(false)	
	
	

