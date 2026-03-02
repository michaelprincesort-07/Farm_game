extends Node2D


var distance_from_mouse = 0

var button1 = false
var button2 = false
var button3 = false
var button4 = false
var button5 = false
var button6 = false
var button7 = false
var button8 = false
var button9 = false
var button10 = false
var button11 = false
var button12 = false
var button13 = false
var button14 = false
var button15 = false
var button16 = false


var slots = {}


var slot1 = null
var slot2 = null
var slot3 = null
var slot4 = null
var slot5 = null
var slot6 = null
var slot7 = null
var slot8 = null
var slot9 = null
var slot10 = null
var slot11 = null
var slot12 = null
var slot13 = null
var slot14 = null
var slot15 = null
var slot16 = null


var day_tracker = 0
var physical_items = []
var item_dict = {}

var active_hand = {
	"slot_1":false,"slot_2":false,
	"slot_3":false,"slot_4":false,
	"slot_5":false,"slot_6":false,
	"slot_7":false,"slot_8":false,
	"slot_9":false,"slot_10":false,
	"slot_11":false,"slot_12":false,
	"slot_13":false,"slot_14":false,
	"slot_15":false,"slot_16":false
	}

#var slots = {"slot_1":[false,slot1],"slot_2":[false,slot2],"slot_3":[false,slot3],"slot_4":[false,slot4]}

var tomato_object: PackedScene = preload("res://tomato.tscn")
var hoe_object: PackedScene = preload("res://hoe.tscn")
var axe_object: PackedScene = preload("res://axe.tscn")
var egg_object: PackedScene = preload("res://egg_item.tscn")
var seeds_tomato: PackedScene = preload("res://tomato_seeds.tscn")
var seeds_wheat: PackedScene = preload("res://wheat_seeds.tscn")
var wheat_object: PackedScene = preload("res://wheat.tscn")

func _ready() -> void:

	slot1 = $CanvasLayer/Sprite2D/GridContainer2/Button.position + Vector2(4,5)
	slot2 = $CanvasLayer/Sprite2D/GridContainer2/Button2.position + Vector2(13,5)
	slot3 = $CanvasLayer/Sprite2D/GridContainer2/Button3.position + Vector2(22,5)
	slot4 = $CanvasLayer/Sprite2D/GridContainer2/Button4.position + Vector2(31,5)
	
	slot5 = $CanvasLayer/Player_inven_UI/slot_5.position + Vector2(3.5,-42)
	slot6 = $CanvasLayer/Player_inven_UI/slot_6.position + Vector2(13,-42)
	slot7 = $CanvasLayer/Player_inven_UI/slot_7.position  + Vector2(22,-42)
	slot8 = $CanvasLayer/Player_inven_UI/slot_8.position + Vector2(31,-42)
	
	slot9 = $CanvasLayer/Player_inven_UI/slot_9.position + Vector2(3.5,-31)
	slot10 = $CanvasLayer/Player_inven_UI/slot_10.position + Vector2(13,-31)
	slot11 = $CanvasLayer/Player_inven_UI/slot_11.position + Vector2(22,-31)
	slot12 = $CanvasLayer/Player_inven_UI/slot_12.position + Vector2(31,-31)
	
	slot13 = $CanvasLayer/Player_inven_UI/slot_13.position + Vector2(3.5,-20)
	slot14 = $CanvasLayer/Player_inven_UI/slot_14.position + Vector2(13,-20)
	slot15 = $CanvasLayer/Player_inven_UI/slot_15.position + Vector2(22,-20)
	slot16 = $CanvasLayer/Player_inven_UI/slot_16.position + Vector2(31,-20)
	
	slots = {
		"slot_1":[false,slot1,button1],"slot_2":[false,slot2,button2],
		"slot_3":[false,slot3,button3],"slot_4":[false,slot4,button4],
		"slot_5":[false,slot5,button5],"slot_6":[false,slot6,button6],
		"slot_7":[false,slot7,button7],"slot_8":[false,slot8,button8],
		"slot_9":[false,slot9,button9],"slot_10":[false,slot10,button10],
		"slot_11":[false,slot11,button11],"slot_12":[false,slot12,button12],
		"slot_13":[false,slot13,button13],"slot_14":[false,slot14,button14],
		"slot_15":[false,slot15,button15],"slot_16":[false,slot16,button16]
		}
	#item_dict = {"tomato":0,"egg":0,"axe":0}
	
	var hoe = hoe_object.instantiate() 
	var axe = axe_object.instantiate()
	var tomato = tomato_object.instantiate()
	var tomato_seeds = seeds_tomato.instantiate()
	var wheat_seeds = seeds_wheat.instantiate()
	var wheat = wheat_object.instantiate()
	
	item_dict = {
		"tomato":[0,tomato],
		"hoe":[1,hoe],
		"axe":[1,axe],
		"tomato_seeds":[3,tomato_seeds],
		"wheat_seeds":[3,wheat_seeds],
		"wheat":[0,wheat]
	}
	
	for item in item_dict:
		if item_dict[item][0] != 0:
			$CanvasLayer/Sprite2D/GridContainer2.add_child(item_dict[item][1])
			for slot in slots:
				if not slots[slot][0]:
					item_dict[item][1].position = slots[slot][1]
					item_dict[item][1].slot = slot
					slots[slot][0] = true
					physical_items.append(item_dict[item][1])
					break
				else: 
					pass


func _process(delta: float) -> void:
	
	var why = delta
	if why:
		pass
		
	if Input.is_key_pressed(KEY_I):
		pass
		
	var tomato = tomato_object.instantiate()
	var wheat = wheat_object.instantiate()
	
	for child in get_children():
		if "Area2D" in child.name or "plant" in child.name:
			if child.collected:
				if child.plant_name == "tomato":
					add_child(tomato)
					get_child(-1).position = $characte_1.position + Vector2(12,0)
					$farm_area/Dirt_2.tile_grid[child.grid_key][1] = false
				elif child.plant_name == "wheat":
					add_child(wheat)
					get_child(-1).position = $characte_1.position + Vector2(12,0)
					$farm_area/Dirt_2.tile_grid[child.grid_key][1] = false
					#add_child(wheat)
			if Input.is_action_just_pressed("ui_up"):
				child.day += 1
	
	
	if $farm_area/Dirt_2.planted[0]:
		if $farm_area/Dirt_2.planted[1] == "tomato":
			item_dict["tomato_seeds"][0] -= 1
			$farm_area/Dirt_2.planted[0] = false
			print(item_dict["tomato_seeds"][0])
		elif $farm_area/Dirt_2.planted[1] == "wheat":
			item_dict["wheat_seeds"][0] -= 1
			$farm_area/Dirt_2.planted[0] = false
	
	
	for item in physical_items:
		
		for i in range(5,16):
			if item.slot == "slot_%d" %i:
				pass#item.visible = false
		
		for slot in slots:
			if slots[slot][2] and item.slot == slot:
				item.position = get_direction()
		
		
	for item in item_dict:
		
		item_dict[item][0] += $characte_1.items[item]
		
		if item_dict[item][0] != 0:
			if item_dict[item][1] not in physical_items:
				$CanvasLayer/Sprite2D/GridContainer2.add_child(item_dict[item][1])
				for slot in slots:
						if not slots[slot][0]:
							item_dict[item][1].position = slots[slot][1]
							item_dict[item][1].slot = slot
							slots[slot][0] = true
							physical_items.append(item_dict[item][1])
							break
						else: 
							pass
			else: pass
		else:
			if item_dict[item][1] in physical_items:
				$CanvasLayer/Sprite2D/GridContainer2.remove_child(item_dict[item][1])
				var index = 0
				for items in physical_items:
					if items == item_dict[item][1]:
						physical_items.remove_at(index)
						slots[items.slot][0] = false 
					index += 1
		
		
	for value in active_hand:
		if active_hand[value]:
			$characte_1.item_in_hand = "none"
			for item in physical_items:
				if item.slot == value:
					$characte_1.item_in_hand = item.name
					


func get_direction():
	
	var change_x = (get_global_mouse_position().x) + distance_from_mouse.x
	var change_y = (get_global_mouse_position().y) + distance_from_mouse.y
	#print(distance_from_mouse)
	return Vector2(change_x,change_y)


func clamp_position(node):
	
	for slot in slots:
		if (slots[slot][1].x-5) < node.position.x and node.position.x < (slots[slot][1].x + 6):
			if (slots[slot][1].y-5) < node.position.y and node.position.y < (slots[slot][1].y + 6):
				slots[node.slot][0] = false
				for item in physical_items:
					if item.slot == slot:
						item.slot = node.slot
						item.position = slots[node.slot][1]
						slots[slot][0] = true
				node.position = slots[slot][1]
				node.slot = slot
				slots[slot][0] = true
				return
				
	node.position = slots[node.slot][1]
				


func drag_and_clamp():
	for item in physical_items:
		for slot in slots:
			if slots[slot][2] and item.slot == slot:
				distance_from_mouse = (item.position - get_global_mouse_position())
			elif not slots[slot][2] and item.slot == slot:
				clamp_position(item)


func _on_button_button_down() -> void:
	for item in physical_items:
		if item.slot == "slot_1":
			distance_from_mouse = (item.position - get_global_mouse_position())
	slots["slot_1"][2] = true 
	#drag_and_clamp()
	
func _on_button_button_up() -> void:
	slots["slot_1"][2] = false 
	drag_and_clamp()
	
	
func _on_button_2_button_down() -> void:
	slots["slot_2"][2] = true 
	drag_and_clamp()

func _on_button_2_button_up() -> void:
	slots["slot_2"][2] = false 
	drag_and_clamp()
	
	
func _on_button_3_button_down() -> void:
	slots["slot_3"][2] = true 
	drag_and_clamp()
	
func _on_button_3_button_up() -> void:
	slots["slot_3"][2] = false
	drag_and_clamp()
	 
	
	
func _on_button_4_button_down() -> void:
	slots["slot_4"][2] = true 
	drag_and_clamp()
	
func _on_button_4_button_up() -> void:
	slots["slot_4"][2] = false 
	drag_and_clamp()


func _on_slot_5_button_down() -> void:
	slots["slot_5"][2] = true 
	drag_and_clamp()

func _on_slot_5_button_up() -> void:
	slots["slot_5"][2] = false 
	drag_and_clamp()


func _on_slot_6_button_down() -> void:
	slots["slot_6"][2] = true 
	drag_and_clamp()

func _on_slot_6_button_up() -> void:
	slots["slot_6"][2] = false 
	drag_and_clamp()


func _on_slot_7_button_down() -> void:
	slots["slot_7"][2] = true 
	drag_and_clamp()
	
func _on_slot_7_button_up() -> void:
	slots["slot_7"][2] = false 
	drag_and_clamp()
	
	
func _on_slot_8_button_down() -> void:
	slots["slot_8"][2] = true 
	drag_and_clamp()

func _on_slot_8_button_up() -> void:
	slots["slot_8"][2] = false 
	drag_and_clamp()


func _on_slot_9_button_down() -> void:
	slots["slot_9"][2] = true 
	drag_and_clamp()

func _on_slot_9_button_up() -> void:
	slots["slot_9"][2] = false 
	drag_and_clamp()


func _on_slot_10_button_down() -> void:
	slots["slot_10"][2] = true 
	drag_and_clamp()

func _on_slot_10_button_up() -> void:
	slots["slot_10"][2] = false 
	drag_and_clamp()


func _on_slot_11_button_down() -> void:
	slots["slot_11"][2] = true 
	drag_and_clamp()

func _on_slot_11_button_up() -> void:
	slots["slot_11"][2] = false
	drag_and_clamp()


func _on_slot_12_button_down() -> void:
	slots["slot_12"][2] = true 
	drag_and_clamp()

func _on_slot_12_button_up() -> void:
	slots["slot_12"][2] = false 
	drag_and_clamp()


func _on_slot_13_button_down() -> void:
	slots["slot_13"][2] = true 
	drag_and_clamp()

func _on_slot_13_button_up() -> void:
	slots["slot_13"][2] = false 
	drag_and_clamp()


func _on_slot_14_button_down() -> void:
	slots["slot_14"][2] = true 
	drag_and_clamp()

func _on_slot_14_button_up() -> void:
	slots["slot_14"][2] = false 
	drag_and_clamp()


func _on_slot_15_button_down() -> void:
	slots["slot_15"][2] = true 
	drag_and_clamp()

func _on_slot_15_button_up() -> void:
	slots["slot_15"][2] = false
	drag_and_clamp()


func _on_slot_16_button_down() -> void:
	slots["slot_16"][2] = true 
	drag_and_clamp()

func _on_slot_16_button_up() -> void:
	slots["slot_16"][2] = false 
	drag_and_clamp()
	
		
		
func _on_button_toggled(toggled_on: bool) -> void:
	for slot in active_hand:
		if slot == "slot_1":
			active_hand[slot] = true
		else:
			active_hand[slot] = false
			

func _on_button_2_toggled(toggled_on: bool) -> void:
	for slot in active_hand:
		if slot == "slot_2":
			active_hand[slot] = true
		else:
			active_hand[slot] = false
			
			
func _on_button_3_toggled(toggled_on: bool) -> void:
	for slot in active_hand:
		if slot == "slot_3":
			active_hand[slot] = true
		else:
			active_hand[slot] = false
			

func _on_button_4_toggled(toggled_on: bool) -> void:
	for slot in active_hand:
		if slot == "slot_4":
			active_hand[slot] = true
		else:
			active_hand[slot] = false
