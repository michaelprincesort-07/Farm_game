extends TileMapLayer

@export var player: Node2D

var x_min = -62
var x_max = 54
var x_total = x_max - x_min
var y_min = 294
var y_max = 379
var y_total = y_max - y_min
var area_len = Vector2(x_total,y_total)
var pos_1 = Vector2(-62, 355.6768)
var pos_2 = Vector2(-46.60391, 294.0326)
var grid = {1:area_len}


func _ready() -> void:
	
	set_cell(Vector2(0,0),1,Vector2(3,3))
	print(get_cell_atlas_coords(Vector2(0,0)))


func _on_farm_area_body_entered(body: Node2D) -> void:
	
	get_used_cells_by_id(1)
	
	print(body.position)
