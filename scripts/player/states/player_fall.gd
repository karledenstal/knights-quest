extends State
class_name PlayerFall

@export var player: CharacterBody2D
@export var animated_sprite: AnimatedSprite2D

@export var gravity = 400
@export var max_gravity = 500

func _physics_update_state(delta):
	player.velocity.y += gravity * delta
		
	if player.velocity.y > max_gravity:
		player.velocity.y = max_gravity
	
	player.move_and_slide()
	
	if player.is_on_floor():
		transition.emit(self, "PlayerIdle")

func _enter_state():
	animated_sprite.play("fall")

func _exit_state():
	animated_sprite.stop()
