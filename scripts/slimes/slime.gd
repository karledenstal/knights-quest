extends CharacterBody2D
class_name Slime

@onready var animated_sprite = $AnimatedSprite2D

@export var hp = 25

func hit():
	animated_sprite.play("hit")
	hp -= 7
	
	if hp < 0:
		die()

func die():
	queue_free()
