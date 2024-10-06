extends State
class_name PlayerMove

@export var player: CharacterBody2D
@export var animated_sprite: AnimatedSprite2D

var speed = 125
var roll_speed = 200
var roll_max_speed = 250

func _physics_update_state(delta):
	var direction = Input.get_axis("move_left", "move_right")
		
	if direction != 0:
		animated_sprite.flip_h = direction == -1
		player.velocity.x = direction * speed
		
	if !direction:
		transition.emit(self, "PlayerIdle")
		
	if player.is_on_floor() and Input.is_action_just_pressed("jump"):
		transition.emit(self, "PlayerJump")
		
	if player.is_on_floor() and Input.is_action_just_pressed("roll"):
		transition.emit(self, "PlayerRoll")
		
	player.move_and_slide()

func _enter_state():
	animated_sprite.play("run")

func _exit_state():
	animated_sprite.stop()
