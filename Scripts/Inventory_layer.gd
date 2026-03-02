extends Node2D

var distance_from_mouse = 0
var button1 = false
var button2 = false
var button3 = false
var button4 = false
var slots = {}
var item = null

#var slots = {"slot_1":[false,slot1],"slot_2":[false,slot2],"slot_3":[false,slot3],"slot_4":[false,slot4]}

var hoe_scene: PackedScene = preload("res://hoe.tscn")

func _ready() -> void:
	var slot1 = $Sprite2D/GridContainer/Button.position + Vector2(4,4)
	var slot2 = $Sprite2D/GridContainer/Button4.position + Vector2(12,4)
	var slot3 = $Sprite2D/GridContainer/Button2.position + Vector2(22,0)
	var slot4 = $Sprite2D/GridContainer/Button3.position + Vector2(40,0)
	slots = {"slot_1":[false,slot1],"slot_2":[false,slot2],"slot_3":[false,slot3],"slot_4":[false,slot4]}
	
	var hoe = hoe_scene.instantiate() 
	
	$Sprite2D/GridContainer .add_child(hoe)
	#print($Sprite2D/GridContainer/Button2.position)
	item = $Sprite2D/GridContainer.get_child(-1)
	item.position = slot2
	print(item.position)
	item.slot = "slot_2"
	
	slots["slot_1"][0] = true
	

func _process(delta: float) -> void:
	
	if button1 or button2 or button3:
		for slot in slots:
			if item.slot == slot:
				var change_x = (get_global_mouse_position().x) + distance_from_mouse.x
				var change_y = (get_global_mouse_position().y) + distance_from_mouse.y
				#print(distance_from_mouse)
				print(item.position)
				#print(get_local_mouse_position())
				item.position = Vector2(change_x,change_y)
			

func _on_button_button_down() -> void:
	distance_from_mouse = (item.position - get_global_mouse_position())
	button1 = true


func _on_button_button_up() -> void:
	button1 = false
	

func _on_button_2_button_down() -> void:
	distance_from_mouse = (item.position - get_global_mouse_position())
	button2 = true


func _on_button_2_button_up() -> void:
	button2 = false
	

func _on_button_3_button_down() -> void:
	distance_from_mouse = (item.position - get_global_mouse_position())
	button3 = true


func _on_button_3_button_up() -> void:
	button3 = false
	

func _on_button_4_button_down() -> void:
	distance_from_mouse = (item.position - get_global_mouse_position())
	button4 = true


func _on_button_4_button_up() -> void:
	button4 = false
