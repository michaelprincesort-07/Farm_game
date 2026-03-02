extends Resource

class_name Inventory

var items = {}

func add_item(name:String="",quantity:int=0,slot:int=0,res_name:String="none",slot_pos:Vector2 = Vector2(0,0)):
	items[name] = [quantity,slot,res_name,slot_pos]
	
	for item in items:
		print(item)
	
	
