extends RigidBody2D

var can_interact:bool =  false
var interact = false

func _ready() -> void:
	gravity_scale = 0

func _process(delta: float) -> void:
	
	if Input.is_key_pressed(KEY_E):
		interact = true
	
	if can_interact:
		if interact:
			interact = false

func _on_interaction_layer_body_entered(body: Node2D) -> void:
	can_interact = true


func _on_interaction_layer_body_exited(body: Node2D) -> void:
	can_interact = false
	
