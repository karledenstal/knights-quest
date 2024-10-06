extends State
class_name PlayerJump

@export var player: CharacterBody2D
@export var animated_sprite: AnimatedSprite2D

@export var jump_force = 100
@export var gravity = 400
@export var max_gravity = 500

func _physics_update_state(delta):
	var direction = Input.get_axis("move_left", "move_right")
	
	if !player.is_on_floor():
		player.velocity.y += gravity * delta
		
		if player.velocity.y > max_gravity:
			player.velocity.y = max_gravity

	if player.is_on_floor():
		player.velocity.x = direction * jump_force
		player.velocity.y = -jump_force

	player.move_and_slide()
	
	if !player.is_on_floor() and player.velocity.y > 0:
		transition.emit(self, "PlayerFall")
		
	if player.is_on_floor() and not direction:
		transition.emit(self, "PlayerIdle")
	
	if player.is_on_floor() and direction:
		transition.emit(self, "PlayerMove")

func _enter_state():
	animated_sprite.play("jump")

func _exit_state():
	animated_sprite.stop()
