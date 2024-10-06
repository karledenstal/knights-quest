extends Node
class_name StateMachine

@export var initial_state: State

var current_state: State
var states: Dictionary = {}

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.transition.connect(_on_child_transition)
	
	if initial_state:
		initial_state._enter_state()
		current_state = initial_state
		
func _process(delta: float) -> void:
	if current_state:
		current_state._update_state(delta)
		
func _physics_process(delta: float) -> void:
	if current_state:
		current_state._physics_update_state(delta)
	
func _on_child_transition(state, new_state_name):
	if state != current_state:
		return
	
	var new_state = states.get(new_state_name.to_lower())
	
	if !new_state:
		return
		
	if current_state:
		current_state._exit_state()

	new_state._enter_state()
	
	current_state = new_state
