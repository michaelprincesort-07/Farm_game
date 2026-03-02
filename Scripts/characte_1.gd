extends CharacterBody2D

signal open_chest
signal play_dig 

const SPEED = 40.0
const JUMP_VELOCITY = -400.0

var has_picked_up = false
var item_in_hand = "none"
var tomato 
var items = {"tomato":0,"wheat":0,"egg":0,"milk":0,"hoe":0,"axe":0,"tomato_seeds":0,"wheat_seeds":0}
var animation_is_playing = false
var layer_pos = {"front":Vector2(-1,10),"right":Vector2(10,3),"left":Vector2(-12,3),"back":Vector2(-1,-1)}
var farming_layer 

func _ready() -> void:
	$interaction_layer_front.disabled = true

func _physics_process(delta: float) -> void:
	#for item in game_manager.slots:
		#game_manager.item_dict[item][0] = items[item]
	var open = Input.is_physical_key_pressed(KEY_E)
	if open:
		open_chest.emit()
	
	
	
	for pos in layer_pos:
		if $AnimatedSprite2D.character_dir == pos:
			$interaction_layer_front.position = layer_pos[pos]
	
	farming_layer = position + $interaction_layer_front.position
	
	if item_in_hand == "none" or item_in_hand == "tomato_seeds" or item_in_hand == "wheat_seeds":
		animation_is_playing = false
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and item_in_hand == "none" or animation_is_playing:
		velocity = Vector2(0,0)
		pass
	else:
		movement_set()
	


func movement_set():
	
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = Vector2(0,0)
	var move_up = Input.is_physical_key_pressed(KEY_W)
	var move_down = Input.is_physical_key_pressed(KEY_S)
	var move_left = Input.is_physical_key_pressed(KEY_D)
	var move_right = Input.is_physical_key_pressed(KEY_A)

#	var dash = Input.is_physical_key_pressed(KEY_Q)

	if move_up:
		direction += Vector2(0,-1)
	if move_down:
		direction += Vector2(0,1) 
	if move_left:
		direction += Vector2(1,0)
	if move_right:
		direction += Vector2(-1,0)
	
	if input_dir:
		velocity = input_dir * SPEED
	elif direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2(0,0)
		
	move_and_slide()
	
	
func _on_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		play_dig.emit()
		
		
