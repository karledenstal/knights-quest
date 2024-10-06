extends State
class_name PlayerIdle

@export var player: CharacterBody2D
@export var animated_sprite: AnimatedSprite2D

func _physics_update_state(_delta):
	var direction = Input.get_axis("move_left", "move_right")
	
	if !player.is_on_floor():
		transition.emit(self, "PlayerFall")
		
	if direction && player.is_on_floor():
		transition.emit(self, "PlayerMove")
		
	if player.is_on_floor() and Input.is_action_just_pressed("jump"):
		transition.emit(self, "PlayerJump")

func _enter_state():
	animated_sprite.play("idle")

func _exit_state():
	animated_sprite.stop()
