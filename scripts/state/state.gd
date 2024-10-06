extends Node
class_name State

signal transition(state, new_state)

func _enter_state():
	pass
	
func _exit_state():
	pass
	
func _update_state(delta: float):
	pass

func _physics_update_state(delta: float):
	pass
