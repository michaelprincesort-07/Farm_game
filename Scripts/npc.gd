extends RigidBody2D

var can_interact: bool =  false
var speak: bool = false
var clicked_buy: bool = false
var clicked_sell: bool = false

func _ready() -> void:
	gravity_scale = 0
	$Shop_menue.visible = false

func _process(delta: float) -> void:
	
	if Input.is_key_pressed(KEY_E):
		speak = true
	
	if can_interact and speak:
		$Shop_menue.visible = true
	elif not can_interact:
		$Shop_menue.visible = false
		
	if clicked_buy:
		$Shop_menue.visible = false
		

func _on_interaction_layer_body_entered(body: Node2D) -> void:
	can_interact = true


func _on_interaction_layer_body_exited(body: Node2D) -> void:
	can_interact = false
	

func _on_sell_button_pressed() -> void:
	clicked_sell = true


func _on_buy_button_2_pressed() -> void:
	clicked_buy = true
