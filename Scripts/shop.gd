extends ScrollContainer

var item1_price = 5
var item2_price = 10
var item3_price = 100
var item4_price = 150
var item5_price = 200


func _on_button_2_button_down() -> void:
	$GridContainer/Button2/Buy_button2.visible = true

func _on_button_2_button_up() -> void:
	$GridContainer/Button2/Buy_button2.visible = false


func _on_button_3_button_down() -> void:
	$GridContainer/Button3/Buy_button2.visible = true

func _on_button_3_button_up() -> void:
	$GridContainer/Button3/Buy_button2.visible = false


func _on_button_4_button_down() -> void:
	$GridContainer/Button4/Buy_button2.visible = true

func _on_button_4_button_up() -> void:
	$GridContainer/Button4/Buy_button2.visible = false


func _on_button_5_button_down() -> void:
	$GridContainer/Button5/Buy_button2.visible = true

func _on_button_5_button_up() -> void:
	$GridContainer/Button5/Buy_button2.visible = false


func _on_button_6_button_down() -> void:
	$GridContainer/Button6/Buy_button2.visible = true

func _on_button_6_button_up() -> void:
	$GridContainer/Button6/Buy_button2.visible = false
