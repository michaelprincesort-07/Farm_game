extends AnimatedSprite2D

@export var player = CharacterBody2D
var character_dir = "front"
var player_action = false
var on_click = false
@export var delay = 10
var dig = false
var item_in_hand = "none"

var tool_list = ["hoe","axe","watering can"]

func _process(delta: float) -> void:
	var mouse_input = Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)
	#var action_complete = false
	if mouse_input:
		on_click = true 
		
	if player.velocity != Vector2(0,0):
		play_movement_animation()
		
	elif on_click and get_parent().item_in_hand == "axe":
		get_parent().animation_is_playing = true
		match character_dir:
			"front":
				self.play("chop_front")
			"back":
				self.play("chop_back")
			"left":
				self.play("chop_left")
			"right":
				self.play("chop_right")
		
	elif on_click and get_parent().item_in_hand == "hoe":
		get_parent().animation_is_playing = true
		match character_dir:
			"front":
				self.play("dig_front")
			"back":
				self.play("dig_back")
			"left":
				self.play("dig_left")
			"right":
				self.play("dig_right")
		
	else:
		#get_parent().animation_is_playing = false
		match character_dir:
			
			"front":
					self.play("idle_front")
			"back":
				self.play("idle_back")
			"left":
				self.play("idle_left")
			"right":
				self.play("idle_right")
			
			
func play_movement_animation():
	var y_speed = player.velocity.y
	var x_speed = player.velocity.x
	var up_dir = false
	var down_dir = false
	var left_dir = false
	var right_dir = false
	#print(x_speed)
	
	if  y_speed <= -1 and x_speed == 0:
		up_dir = true
	if y_speed >= 1 and x_speed == 0:
		down_dir= true
	if x_speed <= -1:
		left_dir = true
	if x_speed >= 1:
		right_dir = true
	 
	if up_dir:
		self.play("back")
		character_dir = "back"
	if down_dir:
		self.play("front")
		character_dir = "front"
	if left_dir:
		self.play("left")
		character_dir = "left"
	if right_dir:
		self.play("right")
		character_dir = "right"
	
func _on_animation_finished() -> void:
	get_parent().animation_is_playing = false
	on_click = false # Replace with function body.
