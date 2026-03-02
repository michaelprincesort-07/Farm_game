extends TileMapLayer

var active_tile

@export var player: Node2D

var x_min = -62
var x_max = 54
var x_total = x_max - x_min
var y_min = 294
var y_max = 379
var y_total = y_max - y_min

var area_len = Vector2(x_total,y_total)

var local_grid
var global_grid = {}
var tile_grid = {}
var area_grid = {}
var plant_tomato = preload("res://tomato(plant).tscn")
var plant_wheat = preload("res://wheat_plant.tscn")
var planted = [false,"none"]


func _ready() -> void:
	
	set_cell(Vector2(-1,-1),0,Vector2(0,6))
	
	for i in range(64):
		if i != 0:
			global_grid[i] = Vector2((x_total/8),(y_total/6))
	
	#print(get_navigation_map())
	
	for x in range(7):
		for i in range(10):
			if i != 0:
				global_grid[i + (x*9)] *= Vector2(i-1,1)
				global_grid[i + (x*9)] += Vector2(x_min,0)
		
	for x in range(7):
		for i in range(10):
			if i != 0 :
				global_grid[i + (x*9)] *= Vector2(1,x)
				global_grid[i + (x*9)] += Vector2(0,y_min)
	#print(global_grid,"\n")
	
	for i in range(49):
		if i != 0:
			tile_grid[i] = [Vector2i(0,0),false]
	
	var count = 0
	for i in range(6):
		for x in range(-4,4):
			count += 1
			tile_grid[count][0] += Vector2i(x,0)
	
	count = 0
	for i in range(-3,3):
		for x in range(8):
			count += 1
			tile_grid[count][0] += Vector2i(0,i)
	
	#print(tile_grid)
	
	count = 0 
	for i in range(6):
		for x in range(8):
			count += 1
			area_grid[count] = {"y_min":global_grid[2 + x + (i*9)].y,"x_min":global_grid[10 + x + (i*9)].x,"y_max":global_grid[11 + x + (i*9)].y,"x_max":global_grid[11 + x + (i*9)].x}

	#print("\n",area_grid)

func _process(delta: float) -> void:
	compare_position()


func compare_position():
	for key in area_grid:
		
		if player.farming_layer.y < area_grid[key]["y_max"] and player.farming_layer.y > area_grid[key]["y_min"]:
			if player.farming_layer.x < area_grid[key]["x_max"] and player.farming_layer.x > area_grid[key]["x_min"]:
				if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and player.item_in_hand == "hoe" and player.animation_is_playing and not tile_grid[key][1]:
					set_cell(tile_grid[key][0],0,Vector2(0,6))
				
#		elif player.position.y < area_grid[key]["y_max"] and player.position.y > area_grid[key]["y_min"]:
#			if player.position.x < area_grid[key]["x_max"] and player.position.x > area_grid[key]["x_min"]:
				elif Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
					if player.item_in_hand == "tomato_seeds":
						if tile_grid[key][0] in get_used_cells_by_id(0,Vector2(0,6)) and not tile_grid[key][1]:
							planted[0] = true
							planted[1] = "tomato"
							tile_grid[key][1] = true
							var seeds_t = plant_tomato.instantiate()
							set_cell(tile_grid[key][0],0,Vector2(1,1))
							self.get_parent().get_parent().add_child(seeds_t)
							seeds_t.position.x = area_grid[key]["x_max"] - 6.5
							seeds_t.position.y = area_grid[key]["y_max"] - 7
							seeds_t.grid_pos = tile_grid[key][0]
							seeds_t.grid_key = key
							
					elif player.item_in_hand == "wheat_seeds":
						if tile_grid[key][0] in get_used_cells_by_id(0,Vector2(0,6)) and not tile_grid[key][1]:
							planted[0] = true
							planted[1] = "wheat"
							tile_grid[key][1] = true
							var seeds_w = plant_wheat.instantiate()
							set_cell(tile_grid[key][0],0,Vector2(1,1))
							self.get_parent().get_parent().add_child(seeds_w)
							seeds_w.position.x = area_grid[key]["x_max"] - 6.5
							seeds_w.position.y = area_grid[key]["y_max"] - 7
							seeds_w.grid_pos = tile_grid[key][0]
							seeds_w.grid_key = key


func _on_farm_area_body_entered(body: Node2D) -> void:
	
	get_used_cells_by_id(1)
	print(body.position)
