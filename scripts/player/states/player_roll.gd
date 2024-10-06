extends State
class_name PlayerRoll

@export var player: CharacterBody2D
@export var animated_sprite: AnimatedSprite2D

var roll_speed = 175

func _ready() -> void:
	animated_sprite.animation_finished.connect(_on_roll_finished)

func _physics_update_state(delta):
	var direction = Input.get_axis("move_left", "move_right")
		
	if direction != 0:
		animated_sprite.flip_h = direction == -1
		player.velocity.x = direction * roll_speed
		
	player.move_and_slide()

func _on_roll_finished():
	var direction = Input.get_axis("move_left", "move_right")

	if !direction:
		transition.emit(self, "PlayerIdle")
	else:
		transition.emit(self, "PlayerMove")

func _enter_state():
	animated_sprite.play("roll")

func _exit_state():
	animated_sprite.stop()
