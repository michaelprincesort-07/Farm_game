extends RigidBody2D

@export var speed = 3
var animation = "idle"
var timer = 0
var direction = {
	1:["south",Vector2(0,1),false],
	2:["north",Vector2(0,-1),true],
	3:["west",Vector2(1,0),false],
	4:["east",Vector2(-1,0),true],
	5:["north-east",Vector2(-1,-1),true],
	6:["north-west",Vector2(1,-1),false],
	7:["south-east",Vector2(-1,1),true],
	8:["south-west",Vector2(1,1),false]
				}
var rand_num
var can_collide = true
var has_colided = false
var last_num

func _ready() -> void:
	gravity_scale = 0 
	max_contacts_reported = 20


func _process(delta: float) -> void:
	
	#print(rand_num)
	#print(get_contact_count())

	timer += 1*delta
	
	if timer <= 500*delta:
		move_and_collide(Vector2(0,0))
		rand_num = randi_range(1,8)
		if rand_num == last_num:
			rand_num = randi_range(1,8)
		animation = "idle"
		has_colided = false
		last_num = rand_num
		
	elif timer > 500*delta and timer <= 1000*delta:
		$chicken_sprites.flip_h = direction[rand_num][2]
		#self.scale.x *= -1
		move_and_collide(direction[rand_num][1] * delta * speed)
		
		if not has_colided:
			animation = "walk"
		else:
			timer = 0
			animation = "idle"
	
	elif timer > 1000*delta and timer <= 1500*delta:
		move_and_collide(Vector2(0,0))
		rand_num = randi_range(1,8)
		if rand_num == last_num:
			rand_num = randi_range(1,8)
		animation = "idle"
		has_colided = false
		last_num = rand_num
		
	elif timer > 1500*delta and timer <= 2000*delta:
		$chicken_sprites.flip_h = direction[rand_num][2]
		#self.scale.x *= -1
		move_and_collide(direction[rand_num][1] * delta * speed)
		
		if not has_colided:
			animation = "walk"
		else:
			timer = 0
			animation = "idle"
		
	else:
		timer = 0
		has_colided = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	has_colided = true
