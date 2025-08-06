extends StaticBody2D

var PLAYER_SPEED = 5

var DIR_VECTORS = {
		"move_up"   : Vector2(0.0, -1.0),
		"move_down" : Vector2(0.0, 1.0),
		"move_right": Vector2(1.0, 0.0),
		"move_left" : Vector2(-1.0, 0.0),
	}

func all(list: Array) -> bool:
	for element in list:

		if type_string(typeof(element)) != "bool": 
			push_error("all() only compatible with arrays exclusively of bools")
			
		if not element: return false
	return true

func v2_sum(list: Array[Vector2]) -> Vector2:
	var res_vec: Vector2 = Vector2(0.0, 0.0)

	for element in list:
		if not type_string(typeof(element)) == "Vector2":
			push_error("v2_sum only compatible with array of Vector2 objects")
		res_vec += element
	
	return res_vec
	
func items(dict: Dictionary) -> Array:
	var keys: Array = dict.keys()
	var vals: Array = dict.values()
	var items: Array = [] 
	
	for i in range(len(keys)):
		items.append([keys[i], vals[i]])
		
	return items

func _ready() -> void:
	print("Player Node ready!")
	print("NOTE: arctan2(0, 0) resolves to " + str(atan2(0, 0)) + " in GDScript")
	
func handle_movement() -> void:
	var mvmt_arrays: Array[Vector2] = []
	for dir_packet in items(DIR_VECTORS):
		if Input.is_action_pressed(dir_packet[0]):
			mvmt_arrays.append(dir_packet[1])

	var mvmt_vector = v2_sum(mvmt_arrays)
	
	var velocity
	if mvmt_vector.x == 0 and mvmt_vector.y == 0:
		# still condition
		velocity = Vector2(0.0, 0.0)
	else:
		var theta = atan2(mvmt_vector.y, mvmt_vector.x) # in radians
		velocity = Vector2(PLAYER_SPEED*cos(theta), PLAYER_SPEED*sin(theta))
	
	self.position += velocity

func _physics_process(_delta: float) -> void:
	handle_movement()
