extends RigidBody2D

signal play_chest_animation
signal chest_opened
signal close_ui
signal button_pressed

var current_pos
var can_open = false

func _ready() -> void:
	self.gravity_scale = 0
	self.lock_rotation = true
	self.inertia = 0
	#print(get_contact_count())
	contact_monitor = true
	max_contacts_reported = 20
	
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	can_open = true
	body.get_angle_to(body.position)
	
	
func _on_area_2d_body_exited(body: Node2D) -> void:
	can_open = false
	close_ui.emit()
	body.get_angle_to(body.position)
	
	
func _on_characte_1_open_chest() -> void:
	if can_open:
		play_chest_animation.emit()
		chest_opened.emit()
	
	
func _on_texture_button_pressed() -> void:
	button_pressed.emit()
	
	
